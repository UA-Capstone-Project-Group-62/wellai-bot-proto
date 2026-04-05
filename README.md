# WellAI Bot Protobuf Definitions

## Generate Code

> [!IMPORTANT]  
> Make sure to generate code after modifying protobuf definitions to keep client libraries up-to-date.

### Prerequisites

Install these tools before generating code:

1. `protoc` (Protocol Buffers compiler)
2. `uv` (Python environment and package runner)
3. `pnpm` (Node.js package manager)

Install dependencies:

```bash
# Install Python dependencies
uv sync
# Install TypeScript dependencies
pnpm install
```

### Generation

From the repository root, run:

```bash
make all
```

This runs both language targets:

1. `make python` (alias: `make py`)
2. `make typescript` (alias: `make ts`)

Generated output folders:

1. Python: `gen/python`
2. TypeScript: `gen/typescript`

To remove generated output:

```bash
make clean
```
