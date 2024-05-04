from urllib.parse import quote_plus

class Config:
    DB_USERNAME = 'root'
    DB_PASSWORD = 'Chotumotu@21'
    DB_HOST = 'localhost'
    DB_NAME = 'researchanalytics'
    ENCODED_PASSWORD = quote_plus(DB_PASSWORD)
    SQLALCHEMY_DATABASE_URI = f'mysql+mysqlconnector://{DB_USERNAME}:{ENCODED_PASSWORD}@{DB_HOST}/{DB_NAME}'
    SQLALCHEMY_TRACK_MODIFICATIONS = False
