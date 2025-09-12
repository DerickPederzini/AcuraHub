from typing import Optional
from langchain_core.retrievers import BaseRetriever
from application.vectorstore import VectorStoreManager

class CustomChromaRetriever(BaseRetriever):
    store: VectorStoreManager
    k: int = 5
    use_mmr: bool = False
    mmr_lambda_mult: float = 0.5
    metadata_filter: Optional[dict] = None

    def get_relevant_documents(self, query: str):
        if self.use_mmr:
            return self.store.mmr_search(
                query, k=self.k, lambda_mult=self.mmr_lambda_mult, metadata_filter=self.metadata_filter
            )
        return self.store.similarity_search(query, k=self.k, metadata_filter=self.metadata_filter)