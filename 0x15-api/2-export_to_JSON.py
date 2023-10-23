#!/usr/bin/python3
"""Accessing a REST API for todo lists of employees"""

import json
import requests
import sys

if __name__ == '__main__':
    if len(sys.argv) != 2:
        print("Usage: {} <employee_id>".format(sys.argv[0]))
        sys.exit(1)

    employeeId = sys.argv[1]
    baseUrl = "https://jsonplaceholder.typicode.com/users"
    url = baseUrl + "/" + employeeId

    response = requests.get(url)
    username = response.json().get('username')

    todoUrl = url + "/todos"
    response = requests.get(todoUrl)
    tasks = response.json()

    employee_data = {
        "employeeId": employeeId,
        "username": username,
        "tasks": []
    }

    for task in tasks:
        employee_data["tasks"].append({
            "task": task.get('title'),
            "completed": task.get('completed')
        })

    with open('{}.json'.format(employeeId), 'w') as filename:
        json.dump(employee_data, filename)
