from fastapi import FastAPI
import mysql.connector
from contextlib import asynccontextmanager
import time

@asynccontextmanager
async def lifespan(app: FastAPI):
	try:
		db = mysql.connector.connect(
			host="mysql",
			port=3306,
			user="root",
			password="root",
			database="foraneos"
		)
		print("\tHola")
	except mysql.connector.Error as err:
		print(f"Erorr: {err}")
	yield
	print("\tadios papus :'v")

app = FastAPI(lifespan=lifespan)

@app.get("/")
def read_root():
    return {"message": "Hello, World!", "status": "running"}

@app.get("/health")
def health_check():
    return {"status": "healthy"}
