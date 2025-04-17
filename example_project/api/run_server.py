from typing import Any

import uvicorn
from fastapi import FastAPI

from example_project.data_parser.str_converter import StrConverter

app = FastAPI(
    title="Greeting API",
    description="A simple API that provides greeting functionality",
    version="1.0.0",
)


@app.get("/greetings", response_model=dict[str, str])
async def get_greeting() -> dict[str, Any]:
    """Get a friendly greeting message.

    Returns:
        dict: A dictionary containing the greeting message
    """
    str_converter = StrConverter()
    return {"message": str_converter.parse_data("Hello! Welcome to the FastAPI server!")}


if __name__ == "__main__":
    uvicorn.run("run_server:app", host="0.0.0.0", port=8000, reload=True)
