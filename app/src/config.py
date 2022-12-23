from dataclasses import dataclass
import os
from dotenv import load_dotenv

load_dotenv(override=True)

@dataclass
class Config:
    aws_access_key: str
    aws_secret_key: str
    db_host: str
    db_user: str
    db_port: str
    db_password: str
    db_name: str


CONFIG = Config(
    aws_access_key= os.environ.get('AWS_ACCESS_KEY'),
    aws_secret_key= os.environ.get('AWS_SECRET_KEY'),
    db_host= os.environ.get('DB_HOST'),
    db_user= os.environ.get('DB_USER'),
    db_port= os.environ.get('DB_PORT'),
    db_password= os.environ.get('DB_PWD'),
    db_name= os.environ.get('DB_NAME')
)

