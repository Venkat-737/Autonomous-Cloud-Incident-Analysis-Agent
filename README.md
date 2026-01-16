# Autonomous Cloud Incident Analysis Agent

> Refracting system noise into actionable clarity.

![Incident Analysis](assets/incident-analysis.png)
![Analysis Result](assets/analysis.png)
![History](assets/history.png)
![Settings](assets/settings.png)

**Autonomous Cloud Incident Analysis Agent** is an advanced, AI-powered engineering co-pilot designed to autonomously diagnose issues across a distributed, multi-cloud environment.

It functions as an expert system that, upon receiving a natural language query, actively investigates the live infrastructure. It gathers real-time data from **Kubernetes**, **AWS CloudWatch**, and **GitHub Actions**, analyzes the combined data, and presents a definitive root cause analysis with actionable recommendations in a clean, web-based dashboard.
## Configuration

Create a `.env` file in the root directory:

```env
# AI Provider
GROQ_API_KEY=gsk_...

# AWS Configuration (Required for CloudWatch Logs)
AWS_ACCESS_KEY_ID=AKIA...
AWS_SECRET_ACCESS_KEY=...
AWS_REGION=us-east-1

# GitHub Configuration (For analyzing workflow runs)
GITHUB_TOKEN=ghp_...
GITHUB_OWNER=your_username
GITHUB_REPO=target_repo_name

# Kubernetes (Optional - defaults to ~/.kube/config)
KUBECONFIG=path/to/kube/config

# Database
MONGO_DB_URI=mongodb+srv://...
```

## The Problem

In modern software operations, an issue (like a failed deployment) can be caused by a problem in the Kubernetes cluster, a failure in the CI/CD pipeline, or an error surfacing in the cloud logs. Engineers must manually jump between multiple dashboards (Grafana, CloudWatch, GitHub, Lens) to correlate data and find the root cause. This process is time-consuming, error-prone, and requires significant domain expertise.

## The Solution: Autonomous Cloud Incident Analysis Agent

Autonomous Cloud Incident Analysis Agent solves this by:

1.  **Unifying** all relevant data sources into one interface.
2.  **Automating** the data collection and correlation process.
3.  **Using AI** to analyze the *raw, live data*—not just guess based on the query—to provide a single, intelligent, and data-driven answer.

An engineer simply describes the problem (e.g., "Analyze all"), and Autonomous Cloud Incident Analysis Agent delivers a complete report, turning a 30-minute investigation into a 30-second query.

## ✨ Key Features

  * **AI-Powered Root Cause Analysis:** Uses a Llama 3.3 70B model via Groq to analyze real-time data and pinpoint the exact cause of an incident.
  * **Multi-Platform Data Collection:** Actively fetches metrics, logs, and statuses from Kubernetes, AWS CloudWatch, and GitHub Actions.
  * **Model Context Protocol (MCP):** Implements a custom, standardized protocol for fetching and structuring data, making it perfectly formatted for the AI model and easily extensible to new services.
  * **Unified Dashboard:** A clean, intuitive React frontend for submitting queries, viewing analysis history, and managing service configurations.
  * **Actionable Recommendations:** Provides concrete, step-by-step commands and long-term recommendations to fix the issue and prevent it from recurring.

## 🏗️ Architecture

Autonomous Cloud Incident Analysis Agent is built on a sophisticated, decoupled architecture:

1.  **React Frontend:** The engineer's command center. It provides a clean UI for submitting analysis queries, viewing analysis history, and displaying the final, structured report.

2.  **`UnifiedAgent` (FastAPI Backend):** This is the "brain" of the operation. It's a FastAPI server that receives requests from the React app. Its main job is to coordinate the data gathering and execute the AI analysis.

3.  **Model Context Protocol (MCP):** This is the project's most innovative feature. It's a custom-defined protocol that standardizes how data is fetched, structured, and "packaged" from any service, making it ready for the Language Model.

4.  **MCP Clients:** These are the "hands" of the agent, implementing the MCP for specific services:

      * **Kubernetes MCP Client:** Connects to the K8s API to fetch real-time pod/node status, restart counts, and cluster health.
      * **AWS MCP Client:** Connects to the CloudWatch API to fetch log group data, metrics, and any detected anomalies.
      * **GitHub MCP Client:** Connects to the GitHub API to fetch the status of CI/CD workflows and recent action runs.

5.  **AI Core (LangChain + Groq):** The `UnifiedAgent` uses `langchain_groq` to send the final, context-rich prompt (containing the user's query + all the data gathered by the MCP clients) to the `llama-3.3-70b-versatile` model.

## 🛠️ Tech Stack

| Category | Technology |
| :--- | :--- |
| **Frontend** | React, Tailwind CSS |
| **Backend** | Python, FastAPI |
| **AI & Orchestration** | LangChain, LangGraph |
| **LLM Provider** | Groq (Llama 3.3 70B) |
| **Data Sources (via MCP)** | Kubernetes, AWS CloudWatch, GitHub Actions |
| **Database** | MongoDB (for history/config) |

## 🚀 Getting Started

### Prerequisites

  * Python 3.10+
  * Node.js 18+
  * Access to a Kubernetes cluster (with `kubeconfig`)
  * AWS credentials (with CloudWatch read access)
  * GitHub Personal Access Token (with `repo` scope)
  * Groq API Key
  * MongoDB connection string

### 1\. Clone the Repository

```bash
git clone https://github.com/Venkat-737/autonomous-cloud-incident-analysis-agent.git
cd autonomous-cloud-incident-analysis-agent
```

### 2\. Backend Setup

```bash
# Navigate to the backend directory
cd backend

# Create a virtual environment and activate it
python -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate

# Install dependencies
pip install -r requirements.txt

# Create a .env file and add your keys
cp .env.example .env
```

Your `.env` file should look like this:

```env
GROQ_API_KEY=gsk_...
# Add any other env vars like AWS keys, DB URI, etc.
MONGO_DB_URI=mongodb+srv://...
```

### 3\. Frontend Setup

```bash
# Navigate to the frontend directory
cd frontend

# Install dependencies
npm install
```

### 4. Run the Application

We have a helper script to start all services (Backend + 3 MCP Servers) at once.

1.  **Start Backend & Services:**
    ```powershell
    .\start_services.ps1
    ```
    *(This will open 4 new terminal windows)*

2.  **Start Frontend:**
    ```bash
    cd frontend
    npm run dev
    ```

3.  **Open Dashboard:**
    Visit `http://localhost:3000`

Open `http://localhost:3000` in your browser to start using Autonomous Cloud Incident Analysis Agent.

