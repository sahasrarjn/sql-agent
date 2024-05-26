import os
from langchain_community.agent_toolkits import create_sql_agent
from prompts import SQL_PREFIX
from langchain_openai import ChatOpenAI
from langchain_community.utilities import SQLDatabase

llm = ChatOpenAI(model="gpt-4o", temperature=0)

mysql_uri = os.getenv('MYSQL_URI', 'mysql+mysqlconnector://root:testpass@localhost:3306/ecom')
db = SQLDatabase.from_uri(mysql_uri)


custom_sql_agent = create_sql_agent(
    llm, 
    db=db, 
    agent_type="openai-tools", 
    verbose=True,
    prefix=SQL_PREFIX,
)

langchain_sql_agent = create_sql_agent(
    llm, 
    db=db, 
    agent_type="openai-tools", 
    verbose=True,
    prefix=SQL_PREFIX,
)