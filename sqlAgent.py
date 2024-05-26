import io
import sys
import streamlit as st
from langchain_openai import ChatOpenAI
from langchain_community.utilities import SQLDatabase
from langchain_community.agent_toolkits import create_sql_agent
from dotenv import load_dotenv
import os
import pandas as pd
import plotly.express as px

from prompts import SQL_PREFIX
load_dotenv()

class StreamToText(io.StringIO):
    def __init__(self):
        super().__init__()
        self.flush()

    def write(self, s):
        self.output += s
        return super().write(s)

    def flush(self):
        self.output = ""

# Create an instance of the class
output_capture = StreamToText()

# Redirect the standard output to the instance of the class
sys.stdout = output_capture

mysql_uri = os.getenv('MYSQL_URI', 'mysql+mysqlconnector://root:testpass@localhost:3306/Chinook')
db = SQLDatabase.from_uri(mysql_uri)

llm = ChatOpenAI(model="gpt-4o", temperature=0)
agent_executor = create_sql_agent(
    llm, 
    db=db, 
    agent_type="openai-tools", 
    verbose=True,
    prefix=SQL_PREFIX,
)

def visualize_data(data):
    if not data.empty:
        st.write("## Data Visualization")
        for column in data.columns:
            if pd.api.types.is_numeric_dtype(data[column]):
                fig = px.histogram(data, x=column, title=f'Distribution of {column}')
                st.plotly_chart(fig)
            else:
                fig = px.bar(data[column].value_counts().reset_index(), x='index', y=column, title=f'Value Counts of {column}')
                st.plotly_chart(fig)

def main():
    st.title("Data Analysis Agent")
    user_query = st.text_input("Please enter your query (or 'exit' to quit): ")
    if st.button('Submit Query'):
        if user_query.lower() == 'exit':
            sys.stdout = sys.__stdout__
            st.stop()
        try:
            result = agent_executor.invoke({"input": user_query})
            st.text_area("SQL Query", output_capture.output, height=200)
            output_capture.flush()
            
            # Fetch the data using the generated SQL query
            query = result['output']
            data = pd.read_sql_query(query, db.engine)
            
            # Display the data
            st.write("## Query Results")
            st.dataframe(data)
            
            # Visualize the data
            visualize_data(data)
            
        except Exception as e:
            st.error(f"An error occurred: {e}")

if __name__ == "__main__":
    main()

