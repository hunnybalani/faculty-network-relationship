import requests
import mysql.connector
from mysql.connector import Error
import time

# def search_author(author_name):
#     max_retries = 5
#     delay = 1
#     url = f"https://api.semanticscholar.org/graph/v1/author/search?query={author_name}"
#     for _ in range(max_retries):
#         response = requests.get(url)
#         if response.status_code == 200:
#             data = response.json()
#             if data and 'data' in data and data['total'] > 0:
#                 author_id = data['data'][0]['authorId']
#                 return author_id
#         elif response.status_code == 429:
#             retry_after = int(response.headers.get('Retry-After', delay))
#             print(f"Rate limit exceeded. Retrying after {retry_after} seconds...")
#             delay *= 2
#             time.sleep(retry_after)
#         else:
#             print(f"Error: {response.status_code}. Retrying in {delay} seconds...")
#             time.sleep(delay)
#             delay *= 2 
#     return None

def search_author(author_name):
    url = f"https://api.semanticscholar.org/graph/v1/author/search?query={author_name}"
    response = requests.get(url)
    if response.status_code == 200:
        data = response.json()
        if data and 'data' in data and data['total'] > 0:
            author_id = data['data'][0]['authorId']
            return author_id
    print(f"Failed to retrieve author ID for {author_name} with status code {response.status_code}.")
    return None

def get_author_details(author_id):
    url = f"https://api.semanticscholar.org/graph/v1/author/{author_id}?fields=name,affiliations,homepage,paperCount,citationCount"
    response = requests.get(url)
    if response.status_code == 200:
        author_details = {}
        data = response.json()
        if 'name' in data:
            author_details['name'] = data['name']
        if 'affiliations' in data:
            author_details['affiliations'] = data['affiliations']
        if 'homepage' in data:
            author_details['homepage'] = data['homepage']
        if 'paperCount' in data:
            author_details['papercount'] = data['paperCount']
        if 'citationCount' in data:
            author_details['citationcount'] = data['citationCount']
        return author_details
    print(f"Failed to author details for author with ID {author_id}.")
    return None

def get_author_papers(author_id):
    url = f"https://api.semanticscholar.org/graph/v1/author/{author_id}/papers"
    response = requests.get(url)
    if response.status_code == 200:
        data = response.json()
        if 'data' in data:
            return data['data']
    print(f"Failed to retrieve papers for author with ID {author_id}.")
    return None

def get_paper_details(paper_id):
    url = f"https://api.semanticscholar.org/graph/v1/paper/{paper_id}?fields=title,year,venue,fieldsOfStudy,referenceCount,citationCount"
    response = requests.get(url)
    if response.status_code == 200:
        data = response.json()
        paper_details = {}
        if 'title' in data:
            paper_details['title'] = data['title']
        if 'year' in data:
            paper_details['year'] = data['year']
        if 'venue' in data:
            paper_details['venue'] = data['venue']
        if 'fieldsOfStudy' in data:
            paper_details['fieldsOfStudy'] = data['fieldsOfStudy']
        if 'referenceCount' in data:
            paper_details['referenceCount'] = data['referenceCount']
        if 'citationCount' in data:
            paper_details['citationCount'] = data['citationCount']
        return paper_details
    else:
        print(f"Failed to retrieve details for paper with ID {paper_id}.")
        return None

def create_connection():
    connection = None
    try:
        connection = mysql.connector.connect(
            host="localhost",
            user="root",
            password="Chotumotu@21",
            database="researchanalytics"
        )
        print("Connection to MySQL DB successful")
    except Error as e:
        print(f"The error '{e}' occurred")

    return connection

def execute_query(connection, query):
    cursor = connection.cursor()
    try:
        cursor.execute(query)
        connection.commit()
        print("Query executed successfully")
    except Error as e:
        print(f"The error '{e}' occurred")

def insert_author(connection, author_data):
    query = f"INSERT INTO authors (author_id, name, affiliations, homepage, paper_count, citation_count) VALUES (%s, %s, %s, %s, %s, %s)"
    cursor = connection.cursor()
    try:
        cursor.execute(query, author_data)
        connection.commit()
        print("Author data inserted successfully")
    except Error as e:
        print(f"The error '{e}' occurred")

def insert_paper(connection, paper_data):
    query = f"INSERT INTO papers (paper_id, title, year, venue, fields_of_study, reference_count, citation_count, author_id) VALUES (%s, %s, %s, %s, %s, %s, %s, %s)"
    cursor = connection.cursor()
    try:
        cursor.execute(query, paper_data)
        connection.commit()
        print("Paper data inserted successfully")
    except Error as e:
        print(f"The error '{e}' occurred")

def main():
    connection = create_connection()

    create_authors_table_query = """
    CREATE TABLE IF NOT EXISTS Authors (
        author_id VARCHAR(255) PRIMARY KEY,
        name VARCHAR(255),
        affiliations TEXT,
        homepage VARCHAR(255),
        paper_count INT,
        citation_count INT
    )
    """
    execute_query(connection, create_authors_table_query)

    create_papers_table_query = """
    CREATE TABLE IF NOT EXISTS Papers (
        paper_id VARCHAR(255) PRIMARY KEY,
        title TEXT,
        year INT,
        venue VARCHAR(255),
        fields_of_study TEXT,
        reference_count INT,
        citation_count INT,
        author_id VARCHAR(255),
        FOREIGN KEY (author_id) REFERENCES Authors(author_id)
    )
    """
    execute_query(connection, create_papers_table_query)

    author_names = ["Mark Aakhus", "Tawfiq Ammari", "Melissa Aronczyk", "Louise Barkhuus", "Galina Bolden", "Brenda Boyer", "Mary Chayko", "Kaitlin L. Costello", "Mary D’Ambrosio", "Marija Dalbello", "Marya Doerfel", "Lauren Feldman", "Suchinthi Fernando", "J. Sophia Fu", "Venkata Rama Kiran Garimella", "Ralph A. Gigliotti", "Kathryn Greene", "Brian Householder", "Shawnika Hull", "Shagun Jhaver", "Goun-ho Kim", "Nancy Kranich", "Dafna Lemish", "Nick Linardopoulos", "Jenny Mandelbaum", "Regina Marchi", 
                    "Matthew Matsaganis", "Lisa Mikesell", "Katherine Ognyanova", "Britt S. Paris", "John V. Pavlik", "Lilia Pavlovsky", "Marie L. Radford", "Yonaira Rivera", "Kristina Scharp", "Jorge Reina Schement", "Charles Senteio", "Sarah Shugars", "Anselm Spoerri", "Lea P. Stewart", "Jennifer Theiss", "Joyce Valenza", "Maria Venetis", "Nina Wacholder", "Khadijah Costley White", "DaJung Woo", "Itzhak Yanovitzky"]
    not_avaialble = ["Mark Beal", "Erin Christie" "Richard Dool", "Calandra Lindstadt", "David Love"]
    many_names = ["Marc Aronson - 145436990", "Jack Z. Bratich - 2086142716", "David Greenberg - 145178258", "Amy Jordan - 144031146", "Susan Kieth - 82385044", "Yi-Yun Cheng - 21707467", "Alexa Hepburn - 33184800", "Sunyoung Kim - 2109659110", "Youngrim Kim - 144733667", "Deepa Kumar - 143755631", "Jeffrey Lane - 145225859", "E.E. Lawrence - 120761042", "Caitlin Petre - 117028828", "Jonathan Potter - 144130404", "Rebecca Reynolds - 143839623", "Brent Ruben - 51392630", "Vivek K. Singh - 47974933",
                  "Matthew Weber - 2110604214", "Todd Wolfson - 49491723"]
    non_research = ["Warren Allen", "Le Anne Barclay-Platenburg", "Neal Bennett", "Roxane Gay", "Steven Miller", "Kaushal Trivedi"]

    for author_name in author_names:
        author_id = search_author(author_name)
        if author_id:
            print(f"Author ID found for {author_name}: {author_id}")
            author_details = get_author_details(author_id)
            if author_details:
                author_data = (author_id, author_details['name'], ', '.join(author_details['affiliations']), author_details.get('homepage', ''), author_details['papercount'], author_details['citationcount'])
                insert_author(connection, author_data)
            
            papers = get_author_papers(author_id)
            if papers:
                print(f"Retrieved {len(papers)} papers for author {author_name}:")
                for paper in papers:
                    paper_id = paper['paperId']
                    paper_details = get_paper_details(paper_id)
                    if paper_details:
                        fields_of_study = ', '.join(paper_details.get('fieldsOfStudy', [])) if isinstance(paper_details.get('fieldsOfStudy'), list) else ''
                        paper_data = (paper_id, paper_details['title'], paper_details['year'], paper_details.get('venue', ''), fields_of_study, paper_details['referenceCount'], paper_details['citationCount'], author_id)
                        insert_paper(connection, paper_data)
            else:
                print("No papers found for the author.")
        else:
            print("Author ID not found.")

    if connection:
        connection.close()
        print("Connection closed.")

if __name__ == "__main__":
    main()
