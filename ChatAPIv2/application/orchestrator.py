from langchain_ollama import OllamaEmbeddings
from datatypes.config.config import CustomSettings
from application.retriever import CustomChromaRetriever
from application.qa import QAService
from application.ingest import PDFIngestor
from application.vectorstore import VectorStoreManager


class Orchestrator:
    def __init__(self, settings: CustomSettings):
        embeddings = OllamaEmbeddings(model="mxbai-embed-large")
        self.vectorstore = VectorStoreManager(settings=settings, embeddings=embeddings)
        self.retriever = CustomChromaRetriever(store=self.vectorstore)
        self.qa = None
        self.settings = settings

    def ingest_pdfs(self):
        docs = PDFIngestor().load()
        self.vectorstore.upsert(docs)

    def ask(self, query: str):
        if self.qa is None:
            self.qa = QAService(self.retriever, self.settings)
        return self.qa.ask(query)