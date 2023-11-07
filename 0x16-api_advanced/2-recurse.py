#!/usr/bin/python3
"""
2-recurse
"""

import requests


def recurse(subreddit, hot_list=[], after=None):
    """
    Recursively queries the Reddit API and returns
    a list of hot articles' titles.

    Args:
        subreddit (str): The name of the subreddit.
        hot_list (list): The list to store the titles
        (default is an empty list).
        after (str): The 'after' parameter for pagination (default is None).

    Returns:
        list: A list containing the titles of hot articles.
    """
    url = f"https://www.reddit.com/r/{subreddit}/hot.json?limit=100&after={after}"
    headers = {'User-Agent': 'Mozilla/5.0'}  # Setting a custom User-Agent

    response = requests.get(url, headers=headers)

    if response.status_code == 200:
        data = response.json()
        posts = data['data']['children']
        after = data['data']['after']

        for post in posts:
            hot_list.append(post['data']['title'])

        if after is not None:
            return recurse(subreddit, hot_list, after)
        else:
            return hot_list
    else:
        return None


if __name__ == '__main__':
    recurse = __import__('2-recurse').recurse
    if len(sys.argv) < 2:
        print("Please pass an argument for the subreddit to search.")
    else:
        result = recurse(sys.argv[1])
        if result is not None:
            print(len(result))
        else:
            print("None")
