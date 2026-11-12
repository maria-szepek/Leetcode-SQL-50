import pandas as pd

def nth_highest_salary(employee: pd.DataFrame, N: int) -> pd.DataFrame:
    column_name = f"getNthHighestSalary({N})" 
    distinct_salaries = employee.loc[
        :,
        ["salary"]
    ] \
    .sort_values(by="salary", ascending=False) \
    .drop_duplicates()

    if len(distinct_salaries) < N or N < 1:
        return pd.DataFrame({column_name: [None]})
    
    return (
        distinct_salaries
        .iloc[[N-1], :]
        .rename(columns={"salary": column_name})
        .reset_index(drop=True)
    )

    # .rename(columns={"salary": column_name})


    # if len(distinct_salaries) < N:
    #     return 

    return distinct_salaries