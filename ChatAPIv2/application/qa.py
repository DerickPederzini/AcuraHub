from langchain.chains import create_retrieval_chain
from langchain.chains.combine_documents import create_stuff_documents_chain
from langchain.prompts import ChatPromptTemplate

from datatypes.config.config import CustomSettings
from application.llm import LLMProvider
from application.retriever import CustomChromaRetriever


class QAService:
    def __init__(self, retriever: CustomChromaRetriever, settings: CustomSettings):
        self.llm = LLMProvider(settings).llm()

        prompt = ChatPromptTemplate.from_template(
            """
            Você é um assistente especializado em onboarding da empresa Eurofarma.
            Use os documentos fornecidos para responder com clareza.
            Responda de maneira resumida e breve, exclusivamente relacionado com o contexto em questão.
            Não misture temas em sua resposta.

            Pergunta: {input}
            Documentos: {context}
            """
        )

        document_chain = create_stuff_documents_chain(self.llm, prompt)
        self.qa_chain = create_retrieval_chain(retriever, document_chain)

    def ask(self, query: str):
        result = self.qa_chain.invoke({"input": query})
        return {
            "answer": result["answer"],
            # "sources": [
            #     {
            #         "file": d.metadata.get("source"),
            #         "chunk": d.metadata.get("chunk_index"),
            #     }
            #     for d in result["context"]
            # ],
        }