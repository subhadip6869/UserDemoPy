from fastapi import FastAPI

app = FastAPI(openapi_url=None)

@app.get("/")
async def read_root():
    return {"Hello": "World"}