# GitHub MCP Server 🐙

This is a **Model Context Protocol (MCP)** server that interacts with GitHub Actions to diagnose CI/CD failures.

## 🛠 Tools Provided
1.  **gh_list_workflow_runs(owner, repo)**: See recent workflow status (Success/Failure).
2.  **gh_check_workflow_health(owner, repo)**: Quick AI-friendly diagnostic of the repo's health.
3.  **gh_get_failure_logs(...)**: Automatically download logs from failed jobs.
4.  **gh_get_workflow_file(...)**: Read the YAML configuration of valid workflows.
5.  **gh_create_issue(...)**: Create a GitHub issue for bugs found.

## 🔑 Configuration
This server requires:
- `GITHUB_TOKEN`: A Personal Access Token with `repo` scope.
