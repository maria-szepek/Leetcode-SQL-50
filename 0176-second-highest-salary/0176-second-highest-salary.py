import pandas as pd

def second_highest_salary(employee: pd.DataFrame) -> pd.DataFrame:
    df = employee.loc[:, ["salary"]].drop_duplicates().sort_values(by="salary", ascending=False)

    col_name = "SecondHighestSalary"

    if len(df) < 2:
        return pd.DataFrame({
            col_name: [None]
        })
    
    return df.iloc[
        [1],
    ].rename(columns={"salary": col_name})