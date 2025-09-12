from dataclasses import dataclass, field
import os

@dataclass
class CustomSettings:
    pdf_folder: str = os.getenv("PDF_FOLDER", "./docs")
    persist_dir: str = os.getenv("CHROMA_DIR", "./chroma_store")
    collection_name: str = os.getenv("COLLECTION", "onboarding_docs")
    chunk_size: int = int(os.getenv("CHUNK_SIZE", 500))
    chunk_overlap: int = int(os.getenv("CHUNK_OVERLAP", 50))
    k: int = int(os.getenv("TOP_K", 5))
    use_mmr: bool = os.getenv("USE_MMR", "false").lower() == "true"
    mmr_lambda_mult: float = float(os.getenv("MMR_LAMBDA", 0.5))
    ollama_model: str = os.getenv("OLLAMA_MODEL", "llama3.2")
    temperature: float = float(os.getenv("TEMPERATURE", 0.2))
    fresh_index: bool = os.getenv("FRESH_INDEX", "false").lower() == "true"
    metadata_filter: dict = field(default_factory=dict)