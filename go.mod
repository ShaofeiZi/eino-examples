module github.com/cloudwego/eino-examples

go 1.23.4

toolchain go1.23.6

require (
	code.byted.org/flow/eino-byted-ext/components/retriever/fornaxknowledge v0.0.0-20250305074440-62bd3c921d2d
	github.com/bytedance/sonic v1.12.9
	github.com/cloudwego/eino v0.3.14
	github.com/cloudwego/eino-ext/components/document/parser/html v0.0.0-20250117061805-cd80d1780d76
	github.com/cloudwego/eino-ext/components/document/parser/pdf v0.0.0-20250117061805-cd80d1780d76
	github.com/cloudwego/eino-ext/components/model/ark v0.0.0-20250224084944-a4e81e88cf1b
	github.com/cloudwego/eino-ext/components/model/deepseek v0.0.0-20250221090944-e8ef7aabbe10
	github.com/cloudwego/eino-ext/components/model/ollama v0.0.0-20250221090944-e8ef7aabbe10
	github.com/cloudwego/eino-ext/components/model/openai v0.0.0-20250304061638-54a3ecef47b5
	github.com/cloudwego/eino-ext/components/retriever/volc_vikingdb v0.0.0-20250221090944-e8ef7aabbe10
	github.com/cloudwego/eino-ext/components/tool/duckduckgo v0.0.0-20250221090944-e8ef7aabbe10
	github.com/cloudwego/eino-ext/devops v0.1.3
	github.com/davecgh/go-spew v1.1.2-0.20180830191138-d8f796af33cc
	github.com/getkin/kin-openapi v0.118.0
	github.com/joho/godotenv v1.5.1
	github.com/ollama/ollama v0.3.0
	github.com/stretchr/testify v1.10.0
)

require (
	code.byted.org/aiops/apm_vendor_byted v0.0.27 // indirect
	code.byted.org/aiops/metrics_codec v0.0.24 // indirect
	code.byted.org/aiops/monitoring-common-go v0.0.4 // indirect
	code.byted.org/bcc/bcc-go-client v0.1.46 // indirect
	code.byted.org/bcc/bcc-go-client/internal/sidecar/idl v0.0.4 // indirect
	code.byted.org/bcc/conf_engine v0.0.0-20230510030051-32fb55f74cf1 // indirect
	code.byted.org/bcc/pull_json_model v1.0.22 // indirect
	code.byted.org/bcc/tools v0.0.21 // indirect
	code.byted.org/bytedtrace-contrib/kitex-go v1.1.52 // indirect
	code.byted.org/bytedtrace/bytedtrace-client-go v1.2.2 // indirect
	code.byted.org/bytedtrace/bytedtrace-common/go v0.0.13 // indirect
	code.byted.org/bytedtrace/bytedtrace-compatible-lightweight-go v1.0.1 // indirect
	code.byted.org/bytedtrace/bytedtrace-conf-provider-client-go v0.0.27 // indirect
	code.byted.org/bytedtrace/bytedtrace-gls-switch v1.2.0 // indirect
	code.byted.org/bytedtrace/bytedtrace-utils-go v1.0.3 // indirect
	code.byted.org/bytedtrace/interface-go v1.0.20 // indirect
	code.byted.org/bytedtrace/serializer-go v1.0.1-pre // indirect
	code.byted.org/bytees/olivere_elastic/v7 v7.0.34 // indirect
	code.byted.org/data-arch/gotbase v1.0.8-0.20220905113555-b9d46a7dc975 // indirect
	code.byted.org/duanyi.aster/gopkg v0.0.4 // indirect
	code.byted.org/flow/eino-byted-ext/byted v0.3.11 // indirect
	code.byted.org/flow/eino-byted-ext/callbacks/metrics v0.1.0 // indirect
	code.byted.org/flow/eino-byted-ext/components/model/llmgateway v0.1.6 // indirect
	code.byted.org/flow/flow-telemetry-common/go v0.0.0-20250206132558-2f2ee3f95cde // indirect
	code.byted.org/flowdevops/errorx v0.0.6 // indirect
	code.byted.org/flowdevops/errorx/code/gen/flow/devops/agent_server v0.0.0-20241012084451-47d6baaffb45 // indirect
	code.byted.org/flowdevops/fornax/pkg/auth v0.0.0-20241211084736-be429d5e6b0c // indirect
	code.byted.org/flowdevops/fornax_sdk v1.1.9 // indirect
	code.byted.org/golf/consul v2.1.13+incompatible // indirect
	code.byted.org/gopkg/apm_vendor_interface v0.0.3 // indirect
	code.byted.org/gopkg/asynccache v0.0.0-20210422090342-26f94f7676b8 // indirect
	code.byted.org/gopkg/consul v1.2.6 // indirect
	code.byted.org/gopkg/context v0.0.1 // indirect
	code.byted.org/gopkg/ctxvalues v0.7.0 // indirect
	code.byted.org/gopkg/debug v0.10.1 // indirect
	code.byted.org/gopkg/env v1.6.18 // indirect
	code.byted.org/gopkg/etcd_util v2.3.3+incompatible // indirect
	code.byted.org/gopkg/etcdproxy v0.1.1 // indirect
	code.byted.org/gopkg/facility v1.0.14 // indirect
	code.byted.org/gopkg/lang v0.21.8 // indirect
	code.byted.org/gopkg/lang/v2 v2.1.3 // indirect
	code.byted.org/gopkg/localcache v0.9.4 // indirect
	code.byted.org/gopkg/localcache/base v0.8.0 // indirect
	code.byted.org/gopkg/localcache/contributes/freecache v0.7.3 // indirect
	code.byted.org/gopkg/localcache/contributes/gcache v0.8.1 // indirect
	code.byted.org/gopkg/localcache/contributes/vfastcache v0.2.0 // indirect
	code.byted.org/gopkg/logid v0.0.0-20241008043456-230d03adb830 // indirect
	code.byted.org/gopkg/logs v1.2.23 // indirect
	code.byted.org/gopkg/logs/v2 v2.2.0-beta.9 // indirect
	code.byted.org/gopkg/metainfo v0.1.4 // indirect
	code.byted.org/gopkg/metrics v1.4.25 // indirect
	code.byted.org/gopkg/metrics/v3 v3.1.31 // indirect
	code.byted.org/gopkg/metrics/v4 v4.1.4 // indirect
	code.byted.org/gopkg/metrics_core v0.0.39 // indirect
	code.byted.org/gopkg/net2 v1.5.0 // indirect
	code.byted.org/gopkg/retry v0.0.0-20230209024914-cf290f094aa7 // indirect
	code.byted.org/gopkg/stats v1.2.12 // indirect
	code.byted.org/gopkg/tccclient v1.5.0-beta.11 // indirect
	code.byted.org/gopkg/thrift v1.14.2 // indirect
	code.byted.org/hystrix/hystrix-go v0.0.0-20190214095017-a2a890c81cd5 // indirect
	code.byted.org/inf/authcenter v1.5.2 // indirect
	code.byted.org/inf/infsecc v1.0.3 // indirect
	code.byted.org/inf/sarama v1.5.1 // indirect
	code.byted.org/kite/endpoint v3.7.5+incompatible // indirect
	code.byted.org/kite/kitc v3.10.26+incompatible // indirect
	code.byted.org/kite/kitex v1.17.2 // indirect
	code.byted.org/kite/kitutil v3.8.8+incompatible // indirect
	code.byted.org/kite/rpal v0.1.19 // indirect
	code.byted.org/kv/backoff v0.0.0-20191031070508-5d868504e646 // indirect
	code.byted.org/kv/circuitbreaker v0.0.0-20200212034351-d3f51a5b9165 // indirect
	code.byted.org/kv/goredis v5.5.7+incompatible // indirect
	code.byted.org/kv/redis-v6 v1.0.29 // indirect
	code.byted.org/lagrange/viking_go_client v0.0.44 // indirect
	code.byted.org/lang/gg v0.19.1 // indirect
	code.byted.org/lang/trace v0.0.3 // indirect
	code.byted.org/lidar/profiler v0.4.4 // indirect
	code.byted.org/lidar/profiler/hertz v0.0.0-20230801111316-7e5562fd8659 // indirect
	code.byted.org/lidar/profiler/kitex v0.0.0-20240515095433-9c7e047c4f64 // indirect
	code.byted.org/log_market/gosdk v0.0.0-20230524072203-e069d8367314 // indirect
	code.byted.org/log_market/loghelper v0.1.11 // indirect
	code.byted.org/log_market/tracelog v0.1.5 // indirect
	code.byted.org/log_market/ttlogagent_gosdk v0.0.6 // indirect
	code.byted.org/log_market/ttlogagent_gosdk/v4 v4.0.53 // indirect
	code.byted.org/middleware/eino v1.0.0-rc.3 // indirect
	code.byted.org/middleware/fic_client v0.2.8 // indirect
	code.byted.org/middleware/hertz v1.13.2 // indirect
	code.byted.org/obric/flow_telemetry_go v1.0.9 // indirect
	code.byted.org/overpass/data_aml_llmflow_engine v0.0.0-20241107145550-f2da45272e96 // indirect
	code.byted.org/overpass/stone_llm_gateway v0.0.0-20250212095743-a71beba3b8a1 // indirect
	code.byted.org/security/go-spiffe-v2 v1.0.8 // indirect
	code.byted.org/security/memfd v0.0.2 // indirect
	code.byted.org/security/sensitive_finder_engine v0.3.18 // indirect
	code.byted.org/security/zti-jwt-helper-golang v1.0.17 // indirect
	code.byted.org/service_mesh/shmipc v0.2.16 // indirect
	code.byted.org/tiktok/buildinfo v0.0.2 // indirect
	code.byted.org/toutiao/elastic/v7 v7.0.42 // indirect
	code.byted.org/trace/trace-client-go v1.3.7 // indirect
	code.byted.org/ttarch/byteconf-cel-go v0.0.3 // indirect
	code.byted.org/videoarch/vfastcache v1.0.10 // indirect
	code.byted.org/webcast/libs_anycache v1.6.7 // indirect
	code.byted.org/webcast/libs_anycache/plugin/cache/base v0.1.1-0.20221212082232-7c36e6844ac9 // indirect
	code.byted.org/webcast/libs_anycache/plugin/cache/objectcache v0.0.1 // indirect
	code.byted.org/webcast/libs_anycache/plugin/codec/base v0.1.0 // indirect
	code.byted.org/webcast/libs_anycache/plugin/refresh v0.1.3 // indirect
	code.byted.org/webcast/libs_sync v0.1.2 // indirect
	github.com/Knetic/govaluate v3.0.1-0.20171022003610-9aa49832a739+incompatible // indirect
	github.com/PuerkitoBio/goquery v1.9.1 // indirect
	github.com/andeya/ameda v1.5.2 // indirect
	github.com/andeya/goutil v0.0.0-20221115092640-94288b660c35 // indirect
	github.com/andybalholm/cascadia v1.3.2 // indirect
	github.com/antlr4-go/antlr/v4 v4.13.0 // indirect
	github.com/antonmedv/expr v1.15.5 // indirect
	github.com/apache/thrift v0.19.0 // indirect
	github.com/aymerick/douceur v0.2.0 // indirect
	github.com/beorn7/perks v1.0.1 // indirect
	github.com/bits-and-blooms/bitset v1.13.0 // indirect
	github.com/bits-and-blooms/bloom/v3 v3.6.0 // indirect
	github.com/blang/semver/v4 v4.0.0 // indirect
	github.com/bluele/gcache v0.0.2 // indirect
	github.com/bufbuild/protocompile v0.8.0 // indirect
	github.com/bytedance/go-tagexpr/v2 v2.9.2 // indirect
	github.com/bytedance/gopkg v0.1.1 // indirect
	github.com/bytedance/sonic/loader v0.2.3 // indirect
	github.com/caarlos0/env/v6 v6.10.1 // indirect
	github.com/cenk/backoff v2.2.1+incompatible // indirect
	github.com/cenkalti/backoff/v4 v4.3.0 // indirect
	github.com/cespare/xxhash v1.1.0 // indirect
	github.com/cespare/xxhash/v2 v2.3.0 // indirect
	github.com/cloudwego/base64x v0.1.5 // indirect
	github.com/cloudwego/configmanager v0.2.2 // indirect
	github.com/cloudwego/dynamicgo v0.4.0 // indirect
	github.com/cloudwego/eino-ext/libs/acl/openai v0.0.0-20250221090944-e8ef7aabbe10 // indirect
	github.com/cloudwego/fastpb v0.0.5 // indirect
	github.com/cloudwego/frugal v0.2.0 // indirect
	github.com/cloudwego/gopkg v0.1.2 // indirect
	github.com/cloudwego/hertz v0.9.3 // indirect
	github.com/cloudwego/iasm v0.2.0 // indirect
	github.com/cloudwego/kitex v0.11.3 // indirect
	github.com/cloudwego/localsession v0.0.2 // indirect
	github.com/cloudwego/netpoll v0.6.4 // indirect
	github.com/cloudwego/runtimex v0.1.0 // indirect
	github.com/cloudwego/thriftgo v0.3.17 // indirect
	github.com/cohesion-org/deepseek-go v1.2.3 // indirect
	github.com/coocood/freecache v1.2.0 // indirect
	github.com/danielgtaylor/huma v1.14.2 // indirect
	github.com/dlclark/regexp2 v1.11.0 // indirect
	github.com/dslipak/pdf v0.0.2 // indirect
	github.com/dustin/go-humanize v1.0.1 // indirect
	github.com/eapache/go-resiliency v1.2.0 // indirect
	github.com/eapache/go-xerial-snappy v0.0.0-20180814174437-776d5712da21 // indirect
	github.com/eapache/queue v1.1.0 // indirect
	github.com/facebookgo/clock v0.0.0-20150410010913-600d898af40a // indirect
	github.com/fatih/structtag v1.2.0 // indirect
	github.com/fsnotify/fsnotify v1.6.0 // indirect
	github.com/go-jose/go-jose/v3 v3.0.3 // indirect
	github.com/go-kit/log v0.2.1 // indirect
	github.com/go-logfmt/logfmt v0.6.0 // indirect
	github.com/go-logr/logr v1.4.2 // indirect
	github.com/go-ole/go-ole v1.3.0 // indirect
	github.com/go-openapi/jsonpointer v0.21.0 // indirect
	github.com/go-openapi/swag v0.23.0 // indirect
	github.com/go-task/slim-sprig v0.0.0-20230315185526-52ccab3ef572 // indirect
	github.com/gogo/protobuf v1.3.2 // indirect
	github.com/golang-jwt/jwt/v5 v5.2.1 // indirect
	github.com/golang/protobuf v1.5.4 // indirect
	github.com/golang/snappy v0.0.4 // indirect
	github.com/google/martian v2.1.0+incompatible // indirect
	github.com/google/pprof v0.0.0-20240727154555-813a5fbdbec8 // indirect
	github.com/google/uuid v1.6.0 // indirect
	github.com/goph/emperror v0.17.2 // indirect
	github.com/gorilla/css v1.0.1 // indirect
	github.com/gorilla/mux v1.8.1 // indirect
	github.com/hashicorp/golang-lru v1.0.2 // indirect
	github.com/hashicorp/hcl v1.0.0 // indirect
	github.com/hbollon/go-edlib v1.6.0 // indirect
	github.com/henrylee2cn/ameda v1.5.0 // indirect
	github.com/henrylee2cn/goutil v0.0.0-20221115092640-94288b660c35 // indirect
	github.com/hertz-contrib/http2 v0.1.1 // indirect
	github.com/hertz-contrib/localsession v0.1.0 // indirect
	github.com/iancoleman/strcase v0.3.0 // indirect
	github.com/invopop/yaml v0.3.1 // indirect
	github.com/jhump/protoreflect v1.15.6 // indirect
	github.com/jmespath/go-jmespath v0.4.0 // indirect
	github.com/josharian/intern v1.0.0 // indirect
	github.com/json-iterator/go v1.1.12 // indirect
	github.com/klauspost/compress v1.17.9 // indirect
	github.com/klauspost/cpuid/v2 v2.2.9 // indirect
	github.com/klauspost/crc32 v1.2.0 // indirect
	github.com/magiconair/properties v1.8.7 // indirect
	github.com/mailru/easyjson v0.9.0 // indirect
	github.com/microcosm-cc/bluemonday v1.0.27 // indirect
	github.com/mitchellh/mapstructure v1.5.0 // indirect
	github.com/modern-go/concurrent v0.0.0-20180306012644-bacd9c7ef1dd // indirect
	github.com/modern-go/gls v0.0.0-20220109145502-612d0167dce5 // indirect
	github.com/modern-go/reflect2 v1.0.2 // indirect
	github.com/mohae/deepcopy v0.0.0-20170929034955-c48cc78d4826 // indirect
	github.com/nikolalohinski/gonja v1.5.3 // indirect
	github.com/nikolalohinski/gonja/v2 v2.3.1 // indirect
	github.com/nyaruka/phonenumbers v1.0.71 // indirect
	github.com/olivere/elastic/v7 v7.0.32 // indirect
	github.com/opentracing/opentracing-go v1.2.1-0.20210726034734-bdbb7cc3a1c0 // indirect
	github.com/pelletier/go-toml/v2 v2.2.3 // indirect
	github.com/perimeterx/marshmallow v1.1.5 // indirect
	github.com/philhofer/fwd v1.1.1 // indirect
	github.com/pierrec/lz4/v4 v4.1.15 // indirect
	github.com/pkg/errors v0.9.1 // indirect
	github.com/pkoukk/tiktoken-go v0.1.7 // indirect
	github.com/pmezard/go-difflib v1.0.1-0.20181226105442-5d4384ee4fb2 // indirect
	github.com/power-devops/perfstat v0.0.0-20240221224432-82ca36839d55 // indirect
	github.com/rcrowley/go-metrics v0.0.0-20201227073835-cf1acfcdf475 // indirect
	github.com/rogpeppe/go-internal v1.13.1 // indirect
	github.com/sashabaranov/go-openai v1.37.0 // indirect
	github.com/shirou/gopsutil/v3 v3.24.2 // indirect
	github.com/sirupsen/logrus v1.9.3 // indirect
	github.com/slongfield/pyfmt v0.0.0-20220222012616-ea85ff4c361f // indirect
	github.com/spf13/afero v1.10.0 // indirect
	github.com/spf13/cast v1.7.0 // indirect
	github.com/spf13/jwalterweatherman v1.1.0 // indirect
	github.com/spf13/pflag v1.0.5 // indirect
	github.com/spf13/viper v1.16.0 // indirect
	github.com/subosito/gotenv v1.4.2 // indirect
	github.com/tidwall/gjson v1.17.3 // indirect
	github.com/tidwall/match v1.1.1 // indirect
	github.com/tidwall/pretty v1.2.1 // indirect
	github.com/tinylib/msgp v1.1.6 // indirect
	github.com/twitchyliquid64/golang-asm v0.15.1 // indirect
	github.com/valyala/bytebufferpool v1.0.0 // indirect
	github.com/valyala/fasttemplate v1.2.2 // indirect
	github.com/vmihailenco/msgpack v4.0.4+incompatible // indirect
	github.com/vmihailenco/msgpack/v4 v4.3.12 // indirect
	github.com/vmihailenco/msgpack/v5 v5.4.1 // indirect
	github.com/vmihailenco/tagparser v0.1.2 // indirect
	github.com/vmihailenco/tagparser/v2 v2.0.0 // indirect
	github.com/volcengine/volc-sdk-golang v1.0.196 // indirect
	github.com/volcengine/volcengine-go-sdk v1.0.181 // indirect
	github.com/yargevad/filepathx v1.0.0 // indirect
	github.com/yusufpapurcu/wmi v1.2.4 // indirect
	github.com/zeebo/errs v1.3.0 // indirect
	go4.org/unsafe/assume-no-moving-gc v0.0.0-20231121144256-b99613f794b6 // indirect
	golang.org/x/arch v0.14.0 // indirect
	golang.org/x/crypto v0.34.0 // indirect
	golang.org/x/exp v0.0.0-20250218142911-aa4b98e5adaa // indirect
	golang.org/x/net v0.35.0 // indirect
	golang.org/x/sync v0.11.0 // indirect
	golang.org/x/sys v0.30.0 // indirect
	golang.org/x/text v0.22.0 // indirect
	golang.org/x/time v0.7.0 // indirect
	google.golang.org/appengine v1.6.8 // indirect
	google.golang.org/genproto/googleapis/api v0.0.0-20241015192408-796eee8c2d53 // indirect
	google.golang.org/genproto/googleapis/rpc v0.0.0-20241021214115-324edc3d5d38 // indirect
	google.golang.org/grpc v1.67.1 // indirect
	google.golang.org/protobuf v1.35.1 // indirect
	gopkg.in/ini.v1 v1.67.0 // indirect
	gopkg.in/vmihailenco/msgpack.v2 v2.9.2 // indirect
	gopkg.in/yaml.v2 v2.4.0 // indirect
	gopkg.in/yaml.v3 v3.0.1 // indirect
)
