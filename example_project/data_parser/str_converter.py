from pydantic import BaseModel


class StrConverter(BaseModel):
    """Data parser for example project."""

    def parse_data(self, data: str) -> str:
        """Parse the data from the given string."""
        return data.lower()
