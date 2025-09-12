from langchain_ollama import OllamaEmbeddings, OllamaLLM
from datatypes.config.config import CustomSettings

class LLMProvider:
    def __init__(self, settings: CustomSettings):
        self.settings = settings

    def embeddings(self):
        return OllamaEmbeddings(model=self.settings.ollama_model)

    def llm(self):
        return OllamaLLM(model=self.settings.ollama_model, temperature=self.settings.temperature)