# Faculty Network Relationship

This project forms networks for faculty based on department, research groups and labs associated to them.

# Contents
## Backend
- This dircetory contains a python flask application for the backend.

## Database
- This contains difefrent sql script to setup the database in MySQL server

# Setup Manual
- Git clone the repository
- Open a terminal at faculty-network-relationship
- Go to backend/config.py and update the DB connection parameters as per your requirements: DB_USERNAME, DB_PASSWORD, DB_HOST, DB_NAME
- Run the database/database_insertion_script.sql on MySQL server
- Install the following repositories
  ```bash
  virtualenv
  flask
  ```
- Activate the virtual environment using the required command
    ```bash
    virtualenv env
    ```
  - MacOS or Unix
    ```bash
    source venv/bin/activate
    ```
  - Windows
    ```bash
    env\Scripts\activate
    ```
- Run the flask application using the following command
    ```bash
    flask run
    ```
