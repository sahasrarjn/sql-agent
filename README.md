# sql-agent

## Setup

This project requires Python 3.6 or later and MySQL.

### Installing MySQL

1. Download MySQL from the official website: https://dev.mysql.com/downloads/mysql/
2. Install MySQL following the instructions on the website.
3. After installation, start the MySQL server.

Refer: https://alejandro-ao.com/chat-with-mysql-using-python-and-langchain/#installing-mysql

### Setting up the Python environment

1. Clone this repository.
2. Navigate to the project directory.
3. Create a virtual environment: `python3 -m venv venv`
4. Activate the virtual environment: `source venv/bin/activate` (Linux/Mac) or `.\venv\Scripts\activate` (Windows)
5. Install the required Python packages: `pip install -r requirements.txt`

### Running the sql-agent

1. Make sure your MySQL server is running.
2. Run the sql-agent: `streamlit run sqlAgent.py`
