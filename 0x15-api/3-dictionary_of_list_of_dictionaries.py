#!/usr/bin/python3
"""Export data in the JSON format."""

from json import dump
from requests import get

if __name__ == "__main__":
    url_users = 'https://jsonplaceholder.typicode.com/users'
    users = get(url_users).json()

    all_data = {}

    for user in users:
        user_id = str(user.get('id'))
        username = user.get('username')

        url_todos = 'https://jsonplaceholder.typicode.com/todos?userId={}'.format(user_id)
        todos = get(url_todos).json()

        todo_list = []
        for task in todos:
            task_dict = {
                "username": username,
                "task": task.get('title'),
                "completed": task.get('completed'),
            }
            todo_list.append(task_dict)

        all_data[user_id] = todo_list

    with open('todo_all_employees.json', 'w') as jsonfile:
        dump(all_data, jsonfile)
