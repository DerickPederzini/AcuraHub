import uvicorn
from fastapi import FastAPI

from application.api import router

app = FastAPI(
    title="teste2"
)

app.include_router(router)

if __name__ == "__main__":
    uvicorn.run("main:application", host="0.0.0.0", port=8000)