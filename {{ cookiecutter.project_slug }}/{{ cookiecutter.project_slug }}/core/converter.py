from pydantic import BaseModel


class Converter(BaseModel):
    def convert(self, data: str) -> str:
        """Lowercase the input string."""
        return data.lower()
