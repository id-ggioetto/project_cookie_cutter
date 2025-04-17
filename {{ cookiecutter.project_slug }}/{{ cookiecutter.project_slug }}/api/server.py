import uvicorn
from fastapi import FastAPI

from {{ cookiecutter.project_slug }}.core.converter import Converter

app = FastAPI(
    title="{{ cookiecutter.project_slug }} API",
    description="API for converting strings",
    version="0.1.0",
)


@app.get("/")
async def root() -> dict[str, str]:
    """Root endpoint returning API status."""
    return {"status": "API is running"}


@app.post("/convert")
async def convert() -> dict[str, str]:
    """Convert the input text using a simple transformation.

    Args:
        request: The conversion request containing the text to convert

    Returns:
        A ConversionResponse containing both original and converted text
    """
    example_string = "Hello, World!"
    converter = Converter()

    output = converter.convert(example_string)

    return {"converted": output}


def main() -> None:
    """Run main function."""
    uvicorn.run(
        "{{ cookiecutter.project_slug }}.api.server:app", host="0.0.0.0", port=8000, reload=True
    )


if __name__ == "__main__":
    main()
