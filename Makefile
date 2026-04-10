PROTO_DIR := proto
PROTO_FILES := $(shell find $(PROTO_DIR) -name '*.proto' | sort)
PY_OUT := gen/py
TS_OUT := gen/ts
PROTOC_GEN_TS_PROTO := $(shell pnpm exec which protoc-gen-ts_proto)

.PHONY: python typescript py ts all clean

py: python

python:
	@mkdir -p $(PY_OUT)
	@uv run python -m grpc_tools.protoc -I . \
		--python_out=$(PY_OUT) \
		--grpc_python_out=$(PY_OUT) \
		--mypy_out=$(PY_OUT) \
		--mypy_grpc_out=$(PY_OUT) \
		$(PROTO_FILES)

ts: typescript

typescript:
	@mkdir -p $(TS_OUT)
	@protoc -I . \
		--plugin=protoc-gen-ts_proto=$(PROTOC_GEN_TS_PROTO) \
		--ts_proto_out=$(TS_OUT) \
		--ts_proto_opt=outputServices=grpc-js,esModuleInterop=true \
		$(PROTO_FILES)

all: python typescript

clean:
	@rm -rf gen
