import os, shutil, hashlib
from langchain_chroma import Chroma
from langchain_core.documents import Document

from datatypes.config.config import CustomSettings

settings = CustomSettings()

class VectorStoreManager:
    def __init__(self, settings: CustomSettings, embeddings):
        self.settings = settings

        if settings.fresh_index and os.path.isdir(settings.persist_dir):
            shutil.rmtree(settings.persist_dir)

        self.vs = Chroma(
            collection_name=settings.collection_name,
            persist_directory=settings.persist_dir,
            embedding_function=embeddings,
        )

    def _make_id(self, doc: Document) -> str:
        """Gera um ID único para cada documento"""
        base = (doc.page_content + str(doc.metadata)).encode("utf-8")
        return hashlib.sha256(base).hexdigest()

    def upsert(self, docs: list[Document]):
        """Adiciona documentos ao vetor store"""
        ids = [self._make_id(d) for d in docs]
        self.vs.add_documents(docs, ids=ids)

    def similarity_search(self, query: str, k: int = None, metadata_filter=None):
        """Busca por similaridade"""
        k = k or self.settings.k
        return self.vs.similarity_search(query, k=k, filter=metadata_filter)

    def mmr_search(self, query: str, k: int = None, lambda_mult=None, metadata_filter=None):
        """Busca usando Maximal Marginal Relevance"""
        k = k or self.settings.k
        lambda_mult = lambda_mult or self.settings.mmr_lambda_mult
        return self.vs.max_marginal_relevance_search(query, k=k, lambda_mult=lambda_mult, filter=metadata_filter)
