import pandas as pd
import re 
def valid_emails(users: pd.DataFrame) -> pd.DataFrame:
    
    return users.loc[
        users["mail"].str.match(r"^[a-zA-Z][a-zA-Z0-9_.-]*@leetcode\.com$")
    ]

