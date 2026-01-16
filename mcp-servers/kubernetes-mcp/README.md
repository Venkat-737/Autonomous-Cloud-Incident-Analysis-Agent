# Kubernetes MCP Server ☸️

This is a **Model Context Protocol (MCP)** server that provides real-time status of your Kubernetes cluster.

## 🛠 Tools Provided
1.  **list_pods(namespace)**: List all pods, their status (Running/CrashLoopBackOff), and restart counts.
2.  **get_nodes()**: Check the health of the cluster nodes (CPU/Memory capacity).
3.  **health_check()**: Simple ping to verify API server connectivity.

## 🔑 Configuration
This server uses the standard `KUBECONFIG` file.
- It automatically tries to load `~/.kube/config`.
- Or you can set the `KUBECONFIG` environment variable in `.env`.
