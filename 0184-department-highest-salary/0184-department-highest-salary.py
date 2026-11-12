import pandas as pd

def department_highest_salary(employee: pd.DataFrame, department: pd.DataFrame) -> pd.DataFrame:
    res = pd.merge(employee, department, left_on="departmentId", right_on="id", how="inner")
    res["highest_salary"] = res.groupby(
        ['departmentId'],
        # as_index=False
    )["salary"].transform("max")

    return res.loc[
        res["salary"] == res["highest_salary"],
        ["name_y", "name_x", "highest_salary"]
    ].rename(
        columns={
            "name_y": "Department",
            "name_x": "Employee",
            "highest_salary": "Salary"
        }
    )
