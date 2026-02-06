from fastapi import FastAPI
from pydantic import BaseModel
from afinn import Afinn

app = FastAPI()
afinn = Afinn()

class TextInput(BaseModel):
    text: str

@app.post("/v1/sentiment")
def analyze_sentiment(text: TextInput):
    lowered_text = text.text.lower()
    score = afinn.score(lowered_text)
    
    # Clamp score to -5 to 5 range
    clamped_score = max(-5, min(5, score))
    
    return {"score": clamped_score}