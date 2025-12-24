import fastapi
import joblib

model = joblib.load('toxic_model.pkl')

