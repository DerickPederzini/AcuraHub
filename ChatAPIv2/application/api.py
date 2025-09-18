from fastapi import Query, FastAPI, APIRouter
from starlette.concurrency import run_in_threadpool
from datatypes.config.config import CustomSettings
from application.orchestrator import Orchestrator

router = APIRouter()
settings = CustomSettings()
orchestrator = Orchestrator(settings)

@router.get("/")
def root():
    return {"message": "API está rodando!"}

@router.get("/ping")
async def ping():
    return {"status": "ok"}

@router.post("/ingest")
async def ingest():
    await run_in_threadpool(orchestrator.ingest_pdfs)
    return {"status": "reindex completed"}

@router.post("/chat")
async def chat(query: str = Query(..., description="Pergunta do usuário")):
    result = await run_in_threadpool(orchestrator.ask, query)
    return result