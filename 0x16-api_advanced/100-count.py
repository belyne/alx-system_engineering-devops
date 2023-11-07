#!/usr/bin/python3
"""
100-count
"""

import requests

def count_words(subreddit, word_list, hot_list=[], after=None):
    """
    Recursively queries the Reddit API, parses titles, and counts keywords.

    Args:
        subreddit (str): The name of the subreddit.
        word_list (list): List of keywords to count.
        hot_list (list): List to store the titles (default is an empty list).
        after (str): The 'after' parameter for pagination (default is None).

    Returns:
        None
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
            return count_words(subreddit, word_list, hot_list, after)
        else:
            count_keywords(word_list, hot_list)
    else:
        return None

def count_keywords(word_list, hot_list):
    """
    Count occurrences of keywords in the list of titles.

    Args:
        word_list (list): List of keywords to count.
        hot_list (list): List of titles.

    Returns:
        None
    """
    keyword_count = {}

    for title in hot_list:
        for word in word_list:
            if word.lower() in title.lower():
                keyword_count[word.lower()] = keyword_count.get(word.lower(), 0) + 1

    sorted_keywords = sorted(keyword_count.items(), key=lambda x: (-x[1], x[0]))

    for keyword, count in sorted_keywords:
        print(f"{keyword}: {count}")

if __name__ == '__main__':
    count_words = __import__('100-count').count_words
    if len(sys.argv) < 3:
        print("Usage: {} <subreddit> <list of keywords>".format(sys.argv[0]))
        print("Ex: {} programming 'python java javascript'".format(sys.argv[0]))
    else:
        result = count_words(sys.argv[1], [x for x in sys.argv[2].split()])
