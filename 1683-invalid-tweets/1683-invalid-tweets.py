import pandas as pd

def invalid_tweets(tweets: pd.DataFrame) -> pd.DataFrame:
    # def f(row):
    #     return True if len(row["content"]) > 15 else False

    # return tweets.filter(
    #     f,
    #     tweets
    # )
    return tweets.loc[
        tweets["content"].str.len() > 15,
        ["tweet_id"]
    ]