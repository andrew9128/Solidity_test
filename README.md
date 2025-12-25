graph TD
    subgraph "External Systems"
        Client[📱 Client / Chatbot]
        SynapseDB[(🐘 Synapse DB<br>PostgreSQL)]
        vLLM[🧠 vLLM Gateway<br>SAIGA / DeepSeek]
    end

    subgraph "GraphRAG System"
        Orchestrator[🎮 Orchestrator API<br>FastAPI]
        Worker[👷 Async Worker]
        Redis[(📮 Redis<br>Queue)]
        
        subgraph "Knowledge Storage"
            FalkorDB[(🗄️ FalkorDB<br>RedisGraph)]
        end
    end

    %% Read Flow
    Client -- "1. Query" --> Orchestrator
    Orchestrator -- "2. Check Perms" --> SynapseDB
    Orchestrator -- "3. Federated Search" --> FalkorDB
    Orchestrator -- "4. Synthesize" --> vLLM

    %% Write Flow
    Client -- "5. New Message" --> Orchestrator
    Orchestrator -- "6. Enqueue Task" --> Redis
    Redis -- "7. Pick Task" --> Worker
    Worker -- "8. Extract Graph" --> vLLM
    Worker -- "9. Write Graph" --> FalkorDB

    classDef component fill:#e1f5fe,stroke:#01579b,stroke-width:2px;
    classDef storage fill:#fff3e0,stroke:#e65100,stroke-width:2px;
    classDef external fill:#f3e5f5,stroke:#4a148c,stroke-width:2px;

    class Orchestrator,Worker component;
    class FalkorDB,Redis storage;
    class Client,SynapseDB,vLLM external;
