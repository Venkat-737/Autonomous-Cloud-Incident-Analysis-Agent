# AWS MCP Server ☁️

This is a **Model Context Protocol (MCP)** server that provides authenticated access to AWS CloudWatch Logs.

## 🛠 Tools Provided
1.  **list_log_groups(prefix)**: Discover log groups in the configured region.
2.  **list_log_streams(log_group)**: List streams within a group (e.g., specific Lambda execution streams).
3.  **get_log_events(log_group, log_stream)**: Retrieve actual log lines to diagnose errors.

## 🔑 Configuration
This server requires the following environment variables (loaded from root `.env`):
- `AWS_ACCESS_KEY_ID`
- `AWS_SECRET_ACCESS_KEY`
- `AWS_REGION`
