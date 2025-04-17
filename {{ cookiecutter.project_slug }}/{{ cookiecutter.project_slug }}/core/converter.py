from pydantic import BaseModel


class Converter(BaseModel):
    def convert(self, data: str) -> str:
        """Lowercase the input string."""
        return data.lower()


if __name__ == "__main__":
    converter = Converter()
    print(converter.convert("Hello, World!"))
