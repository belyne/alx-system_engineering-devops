#!/usr/bin/python3
"""
This script retrieves and displays an employee's
TODO list progress from a given API.
"""

import requests
import sys

if __name__ == "__main__":
    # Check if the correct number of arguments is provided
    if len(sys.argv) != 2:
        print("Usage: {} <employee_id>".format(sys.argv[0]))
        sys.exit(1)

    # Get the employee ID from the command line arguments
    employee_id = sys.argv[1]

    # Make a request to the API to get user info
    user_response = requests.get(
        'https://jsonplaceholder.typicode.com/users/{}'.format(employee_id))
    user_info = user_response.json()

    # Make a request to the API to get user's TODO list
    todo_response = requests.get(
        'https://jsonplaceholder.typicode.com/todos?userId={}'.format(
            employee_id))
    todos = todo_response.json()

    # Calculate the number of completed tasks
    completed_tasks = [task for task in todos if task['completed']]
    num_completed_tasks = len(completed_tasks)
    total_tasks = len(todos)

    # Display employee TODO list progress
    print("Employee {} is done with tasks({}/{}):".format(
        user_info['name'], num_completed_tasks, total_tasks))
    for task in completed_tasks:
        print("\t", task['title'])
