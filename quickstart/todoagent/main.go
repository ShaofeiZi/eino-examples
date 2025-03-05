/*
 * Copyright 2024 CloudWeGo Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package main

import (
	"context"
	"net/http"
	"os"

	"github.com/cloudwego/eino-ext/components/model/openai"
	"github.com/cloudwego/eino-ext/components/tool/duckduckgo"
	"github.com/cloudwego/eino/components/tool"
	"github.com/cloudwego/eino/components/tool/utils"
	"github.com/cloudwego/eino/compose"
	"github.com/cloudwego/eino/schema"

	"github.com/cloudwego/eino-examples/internal/gptr"
	"github.com/cloudwego/eino-examples/internal/logs"

	"github.com/joho/godotenv"
)

// customTransport 自定义HTTP传输层结构体
// 用于在HTTP请求中添加自定义请求头
type customTransport struct {
	http.RoundTripper                   // 内嵌http.RoundTripper接口
	headers           map[string]string // 存储自定义请求头的键值对
}

// RoundTrip 实现http.RoundTripper接口的方法
// 在发送HTTP请求前添加自定义请求头
// 参数:
//   - req: HTTP请求对象
//
// 返回:
//   - *http.Response: HTTP响应对象
//   - error: 错误信息
func (t *customTransport) RoundTrip(req *http.Request) (*http.Response, error) {
	// 遍历并设置所有自定义请求头
	for key, value := range t.headers {
		req.Header.Set(key, value)
	}
	// 调用内嵌RoundTripper的RoundTrip方法发送请求
	return t.RoundTripper.RoundTrip(req)
}

// main 程序入口函数
// 初始化并运行一个基于Eino框架的TODO代理应用
// 该应用集成了多个工具，包括添加、更新、列出TODO项目以及搜索功能
func main() {

	// 加载 .env 文件
	logs.Infof("[步骤1] 开始加载 .env 文件")
	if err := godotenv.Load(); err != nil {
		logs.Errorf("[步骤1] 无法加载 .env 文件: %v", err)
	} else {
		logs.Infof("[步骤1] .env 文件加载成功")
	}

	ctx := context.Background()
	logs.Infof("[步骤2] 创建上下文完成")

	logs.Infof("[步骤3] 开始创建更新待办事项工具")
	updateTool, err := utils.InferTool("update_todo", "Update a todo item, eg: content,deadline...", UpdateTodoFunc)
	if err != nil {
		logs.Errorf("[步骤3] 工具推断失败，错误：%v", err)
		return
	}
	logs.Infof("[步骤3] 更新待办事项工具创建成功")

	// 创建搜索工具
	logs.Infof("[步骤4] 开始创建搜索工具")
	searchTool, err := duckduckgo.NewTool(ctx, &duckduckgo.Config{})
	if err != nil {
		logs.Errorf("[步骤4] 创建搜索工具失败，错误：%v", err)
		return
	}
	logs.Infof("[步骤4] 搜索工具创建成功")

	// 初始化 tools
	logs.Infof("[步骤5] 开始初始化工具集合")
	todoTools := []tool.BaseTool{
		getAddTodoTool(), // 使用 NewTool 方式
		updateTool,       // 使用 InferTool 方式
		&ListTodoTool{},  // 使用结构体实现方式, 此处未实现底层逻辑
		searchTool,
	}
	logs.Infof("[步骤5] 工具集合初始化完成，共 %d 个工具", len(todoTools))

	// 从环境变量获取配置
	apiKey := os.Getenv("CUSTOM_API_KEY")
	baseURL := os.Getenv("CUSTOM_API_URL")
	modelName := os.Getenv("CUSTOM_MODEL_NAME")

	// 初始化默认请求头
	headers := map[string]string{
		"api-key":      apiKey,
		"Content-Type": "application/json",
	}
	client := &http.Client{
		Transport: &customTransport{
			RoundTripper: http.DefaultTransport,
			headers:      headers,
		},
	}

	// 创建并配置 ChatModel
	logs.Infof("[步骤6] 开始创建聊天模型，使用模型：%s", modelName)
	chatModel, err := openai.NewChatModel(context.Background(), &openai.ChatModelConfig{
		BaseURL:     baseURL,
		Model:       modelName,
		HTTPClient:  client,
		Temperature: gptr.Of(float32(0.7)),
	})
	if err != nil {
		logs.Errorf("[步骤6] 创建聊天模型失败，错误：%v", err)
		return
	}
	logs.Infof("[步骤6] 聊天模型创建成功")

	// 获取工具信息, 用于绑定到 ChatModel
	logs.Infof("[步骤7] 开始获取工具信息")
	toolInfos := make([]*schema.ToolInfo, 0, len(todoTools))
	var info *schema.ToolInfo
	for idx, todoTool := range todoTools {
		info, err = todoTool.Info(ctx)
		if err != nil {
			logs.Errorf("[步骤7] 获取第 %d 个工具信息失败，错误：%v", idx+1, err)
			return
		}
		toolInfos = append(toolInfos, info)
		logs.Infof("[步骤7] 成功获取第 %d 个工具信息：%s", idx+1, info.Name)
	}

	// 将 tools 绑定到 ChatModel
	logs.Infof("[步骤8] 开始将工具绑定到聊天模型")
	err = chatModel.BindTools(toolInfos)
	if err != nil {
		logs.Errorf("[步骤8] 绑定工具失败，错误：%v", err)
		return
	}
	logs.Infof("[步骤8] 工具绑定成功")

	// 创建 tools 节点
	logs.Infof("[步骤9] 开始创建工具节点")
	todoToolsNode, err := compose.NewToolNode(context.Background(), &compose.ToolsNodeConfig{
		Tools: todoTools,
	})
	if err != nil {
		logs.Errorf("[步骤9] 创建工具节点失败，错误：%v", err)
		return
	}
	logs.Infof("[步骤9] 工具节点创建成功")

	// 构建完整的处理链
	logs.Infof("[步骤10] 开始构建处理链")
	chain := compose.NewChain[[]*schema.Message, []*schema.Message]()
	chain.
		AppendChatModel(chatModel, compose.WithNodeName("chat_model")).
		AppendToolsNode(todoToolsNode, compose.WithNodeName("tools"))
	logs.Infof("[步骤10] 处理链构建完成")

	// 编译并运行 chain
	logs.Infof("[步骤11] 开始编译处理链")
	agent, err := chain.Compile(ctx)
	if err != nil {
		logs.Errorf("[步骤11] 编译处理链失败，错误：%v", err)
		return
	}
	logs.Infof("[步骤11] 处理链编译成功")

	// 运行示例
	logs.Infof("[步骤12] 开始执行代理调用")
	resp, err := agent.Invoke(ctx, []*schema.Message{
		{
			Role:    schema.User,
			Content: "添加一个学习 Eino 的 TODO，同时搜索一下 cloudwego/eino 的仓库地址",
		},
	})
	if err != nil {
		logs.Errorf("[步骤12] 代理调用失败，错误：%v", err)
		return
	}
	logs.Infof("[步骤12] 代理调用成功")

	// 输出结果
	for idx, msg := range resp {
		logs.Infof("\n")
		logs.Infof("消息 %d: %s: %s", idx, msg.Role, msg.Content)
	}
}

// 获取添加 todo 工具
// 使用 utils.NewTool 创建工具
// getAddTodoTool 创建并返回添加TODO项的工具
// 使用utils.NewTool方法创建工具，定义工具名称、描述和参数
// 返回:
//   - tool.InvokableTool: 可调用的工具接口实现
func getAddTodoTool() tool.InvokableTool {
	info := &schema.ToolInfo{
		Name: "add_todo",
		Desc: "Add a todo item",
		ParamsOneOf: schema.NewParamsOneOfByParams(map[string]*schema.ParameterInfo{
			"content": {
				Desc:     "The content of the todo item",
				Type:     schema.String,
				Required: true,
			},
			"started_at": {
				Desc: "The started time of the todo item, in unix timestamp",
				Type: schema.Integer,
			},
			"deadline": {
				Desc: "The deadline of the todo item, in unix timestamp",
				Type: schema.Integer,
			},
		}),
	}

	return utils.NewTool(info, AddTodoFunc)
}

// ListTodoTool
// 获取列出 todo 工具
// 自行实现 InvokableTool 接口
// ListTodoTool 列出TODO项的工具结构体
// 实现tool.InvokableTool接口
type ListTodoTool struct{}

// Info 实现tool.BaseTool接口的Info方法
// 提供工具的元信息，包括名称、描述和参数定义
// 参数:
//   - ctx: 上下文对象(未使用)
//
// 返回:
//   - *schema.ToolInfo: 工具信息
//   - error: 错误信息
func (lt *ListTodoTool) Info(_ context.Context) (*schema.ToolInfo, error) {
	return &schema.ToolInfo{
		Name: "list_todo",
		Desc: "List all todo items",
		ParamsOneOf: schema.NewParamsOneOfByParams(map[string]*schema.ParameterInfo{
			"finished": {
				Desc:     "filter todo items if finished",
				Type:     schema.Boolean,
				Required: false,
			},
		}),
	}, nil
}

// TodoUpdateParams 更新TODO项的参数结构体
// 定义更新TODO项时可修改的字段
type TodoUpdateParams struct {
	ID        string  `json:"id" jsonschema:"description=id of the todo"`
	Content   *string `json:"content,omitempty" jsonschema:"description=content of the todo"`
	StartedAt *int64  `json:"started_at,omitempty" jsonschema:"description=start time in unix timestamp"`
	Deadline  *int64  `json:"deadline,omitempty" jsonschema:"description=deadline of the todo in unix timestamp"`
	Done      *bool   `json:"done,omitempty" jsonschema:"description=done status"`
}

// TodoAddParams 添加TODO项的参数结构体
// 定义添加TODO项时需要的字段
type TodoAddParams struct {
	Content  string `json:"content"`
	StartAt  *int64 `json:"started_at,omitempty"` // 开始时间
	Deadline *int64 `json:"deadline,omitempty"`
}

// InvokableRun 实现tool.InvokableTool接口的方法
// 处理列出TODO项的请求，支持按完成状态过滤
// 参数:
//   - ctx: 上下文对象(未使用)
//   - argumentsInJSON: JSON格式的参数字符串
//   - options: 工具选项(未使用)
//
// 返回:
//   - string: JSON格式的响应字符串
//   - error: 错误信息
func (lt *ListTodoTool) InvokableRun(_ context.Context, argumentsInJSON string, _ ...tool.Option) (string, error) {
	logs.Infof("调用列出待办事项工具: %s", argumentsInJSON)

	// Tool处理代码
	// ...

	return `{"todos": [{"id": "1", "content": "在2024年12月10日之前完成Eino项目演示文稿的准备工作", "started_at": 1717401600, "deadline": 1717488000, "done": false}]}`, nil
}

// AddTodoFunc 添加TODO项的处理函数
// 处理添加TODO项的请求，记录请求参数并返回成功信息
// 参数:
//   - ctx: 上下文对象(未使用)
//   - params: 添加TODO项的参数
//
// 返回:
//   - string: JSON格式的响应字符串
//   - error: 错误信息
func AddTodoFunc(_ context.Context, params *TodoAddParams) (string, error) {
	logs.Infof("调用添加待办事项工具: %+v", params)

	// Tool处理代码
	// ...

	return `{"msg": "add todo success"}`, nil
}

// UpdateTodoFunc 更新TODO项的处理函数
// 处理更新TODO项的请求，记录请求参数并返回成功信息
// 参数:
//   - ctx: 上下文对象(未使用)
//   - params: 更新TODO项的参数
//
// 返回:
//   - string: JSON格式的响应字符串
//   - error: 错误信息
func UpdateTodoFunc(_ context.Context, params *TodoUpdateParams) (string, error) {
	logs.Infof("调用更新待办事项工具: %+v", params)

	// Tool处理代码
	// ...

	return `{"msg": "update todo success"}`, nil
}
