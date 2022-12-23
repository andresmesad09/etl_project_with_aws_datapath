import boto3
from src.config import CONFIG
from pathlib import Path
import logging
import pandas as pd
import psycopg2  # noqa: F401
from sqlalchemy import create_engine


logging.basicConfig(
    format='[%(asctime)s] %(levelname)s - %(message)s',
    level=logging.INFO
    )
logging.debug('This will get logged')


DRIVER = 'postgresql+psycopg2'
TABLES_IN_PROD = [
    'actor',
    'address',
    'category',
    'city',
    'country',
    'customer',
    'film',
    'film_actor',
    'film_category',
    'inventory',
    'language',
    'payment',
    'rental',
    'staff',
    'store']

TARGET_DIR = Path().cwd() / "csv_files"


def generate_csv_files():
    logging.info("Creating Connection")
    sqlalchemy_url = f"{DRIVER}://{CONFIG.db_user}:{CONFIG.db_password}@{CONFIG.db_host}:{CONFIG.db_port}/{CONFIG.db_name}"
    engine = create_engine(sqlalchemy_url)
    for table in TABLES_IN_PROD:
        logging.info(f"Loop: {table}")
        with engine.begin() as connection:
            output_dataframe = pd.read_sql(f"SELECT * FROM {table}", connection)
            file_name = TARGET_DIR / f"{table}.csv"
            output_dataframe.to_csv(file_name, index=False)
            logging.info(f"Finished: {table}")


def upload_file_to_s3(file_path, s3_client):
    logging.info(f"About to upload {file_path.name}")
    s3_client.upload_file(
        Filename=str(file_path),  # source - from
        Bucket='datapath-final-project',
        Key=f'data/{file_path.stem}/{file_path.name}'  # target name
    )
    logging.info(f"Finished upload of {file_path.name}")


def main():

    # ----
    # Create the client
    # ----
    try:
        s3 = boto3.client(
            's3',
            region_name='us-east-1',
            aws_access_key_id=CONFIG.aws_access_key,
            aws_secret_access_key=CONFIG.aws_secret_key,
        )
        logging.info("S3 Client was created")
        logging.info(s3.list_buckets())
    except Exception:
        logging.error("Error when creating S3 client", exc_info=True)

    # ----
    # Generate the files
    # ----
    generate_csv_files()

    # ----
    # Upload files to S3
    # # ----
    for path in TARGET_DIR.rglob('*.csv'):
        upload_file_to_s3(path, s3)


if __name__ == '__main__':
    main()
