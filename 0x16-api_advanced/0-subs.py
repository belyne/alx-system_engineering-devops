#!/usr/bin/python3
"""
0-subs
"""

import requests


def number_of_subscribers(subreddit):
    """
    Queries the Reddit API and returns the number
    of subscribers for a subreddit.

    Args:
        subreddit (str): The name of the subreddit.

    Returns:
        int: The number of subscribers, or 0 if
        the subreddit is invalid.
    """
    url = "https://www.reddit.com/r/{}/about.json".format(subreddit)
    headers = {'User-Agent': 'Mozilla/5.0'}  # Setting a custom User-Agent

    response = requests.get(url, headers=headers)

    if response.status_code == 200:
        data = response.json()
        subscribers = data['data']['subscribers']
        return subscribers
    else:
        return 0


if __name__ == '__main__':
    number_of_subscribers = __import__('0-subs').number_of_subscribers
    if len(sys.argv) < 2:
        print("Please pass an argument for the subreddit to search.")
    else:
        print("{:d}".format(number_of_subscribers(sys.argv[1])))
