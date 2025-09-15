import glob, os
from typing import List
from langchain_community.document_loaders import PyPDFLoader
from langchain_core.documents import Document
from langchain_text_splitters import TokenTextSplitter

class PDFIngestor:
    def __init__(self, folder: str = None):
        if folder is None:
            base_dir = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
            folder = os.path.join(base_dir, "documents")
        self.folder = folder

    def load(self):
        docs = []
        for path in glob.glob(os.path.join(self.folder, "*.pdf")):
            loader = PyPDFLoader(path)
            loaded = loader.load()
            for d in loaded:
                d.metadata["source"] = os.path.basename(path)
            docs.extend(loaded)
        return docs

class Chunker:
    def __init__(self, chunk_size: int, chunk_overlap: int):
        self.splitter = TokenTextSplitter(chunk_size=chunk_size, chunk_overlap=chunk_overlap)

    def split(self, docs: List[Document]) -> List[Document]:
        chunks: List[Document] = []
        for doc in docs:
            doc_chunks = self.splitter.split_documents([doc])
            for i, c in enumerate(doc_chunks):
                c.metadata = {**c.metadata, "chunk_index": i, "source": doc.metadata.get("source")}
                chunks.append(c)
        return chunks