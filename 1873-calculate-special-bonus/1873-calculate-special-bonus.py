import pandas as pd

def calculate_special_bonus(employees: pd.DataFrame) -> pd.DataFrame:

    employees["bonus"] = employees.apply(
        lambda row: row["salary"] if row["employee_id"] % 2 == 1 and not row["name"].startswith("M") else 0,
        axis = 1
    )
    res = employees.loc[
        :,
        ["employee_id", "bonus"]
    ].sort_values("employee_id")
    return res

    # alternative: employees[bonus] = 0 , then : employees loic[conditions] = employees.salary 
    