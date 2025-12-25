sequenceDiagram
    autonumber
    actor User as 👤 User (@director)
    participant API as ⚙️ Orchestrator API
    participant SynapseDB as 🐘 PostgreSQL (Synapse)
    participant GraphAPI as 🕸️ GraphRAG (Federated)
    participant FalkorDB as 🗄️ FalkorDB (Shards)
    participant vLLM as 🧠 vLLM Gateway

    Note over User, API: Сценарий: Чтение ("Вспомнить")

    User->>API: POST /orchestrate/query<br/>"Any updates on budget?"
    
    rect rgb(240, 248, 255)
    note right of API: 1. Определение прав доступа
    API->>SynapseDB: SELECT rooms FROM memberships WHERE user='@director'
    SynapseDB-->>API: Returns: ['!project_x', '!lounge']
    API->>API: Map rooms to Graph Names:<br/>['channel_project_x', 'channel_lounge']
    end

    rect rgb(255, 240, 245)
    note right of API: 2. Федеративный поиск
    API->>GraphAPI: Parallel Search in multiple graphs
    par Search in Project X
        GraphAPI->>FalkorDB: QUERY graph='channel_project_x'
        FalkorDB-->>GraphAPI: Found: "Budget cut by 20%"
    and Search in Lounge
        GraphAPI->>FalkorDB: QUERY graph='channel_lounge'
        FalkorDB-->>GraphAPI: Found: "Party at Italian restaurant"
    end
    GraphAPI-->>API: Aggregated Context list
    end

    rect rgb(240, 255, 240)
    note right of API: 3. Синтез ответа
    API->>vLLM: Prompt: "Synthesize answer based on context..."
    vLLM-->>API: "Budget is cut, party is on Friday."
    end

    API->>User: JSON Response (Final Answer)
