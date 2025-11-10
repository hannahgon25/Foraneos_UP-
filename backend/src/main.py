from fastapi import FastAPI
import mysql.connector
from contextlib import asynccontextmanager
#import time

db = mysql.connector.MySQLConnection()

@asynccontextmanager
async def lifespan(app: FastAPI):
	global db
	while True:
		try:
			db = mysql.connector.connect(
				host="mysql",
				port=3306,
				user="root",
				password="root",
				database="foraneos"
			)
			print("Conectado a la base de datos")
			break
		except mysql.connector.Error as err:
			print("No se pudo conectar a la base de datos. Reintentando...")
			time.sleep(5)
	yield
	print("\tadios papus :'v")

app = FastAPI(lifespan=lifespan)

@app.get("/")
def read_root():
	cursor = db.cursor()
	cursor.execute("SHOW TABLES;")
	tablas = cursor.fetchall()
	cursor.close()
	return {"tablas": [table[0] for table in tablas]}

@app.get("/select/{table}")
def test(table: str):
	cursor = db.cursor()
	cursor.execute(f"SELECT * FROM {table};")
	result = cursor.fetchall()
	cursor.close()
	return {"result": result}