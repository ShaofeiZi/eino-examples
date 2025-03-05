/*
 * Copyright 2025 CloudWeGo Authors
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
	"log"
	"net/http"
	"os"

	"github.com/cloudwego/eino-ext/components/model/openai"
	"github.com/cloudwego/eino/components/model"
)

type customTransport struct {
	http.RoundTripper
	headers map[string]string
}

func (t *customTransport) RoundTrip(req *http.Request) (*http.Response, error) {
	for key, value := range t.headers {
		req.Header.Set(key, value)
	}
	return t.RoundTripper.RoundTrip(req)
}

func createOpenAIChatModel(ctx context.Context) model.ChatModel {
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

	// 创建 OpenAI 客户端
	chatModel, err := openai.NewChatModel(ctx, &openai.ChatModelConfig{
		BaseURL:    baseURL,
		Model:      modelName,
		HTTPClient: client,
	})
	if err != nil {
		log.Fatalf("create openai chat model failed: %v", err)
	}
	return chatModel
}
