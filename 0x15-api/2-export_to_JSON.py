#!/usr/bin/python3
"""
This script retrieves and exports an employee's
TODO list progress to a JSON file.
"""

import requests
import sys
import json

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

    # Prepare data for JSON export
    json_data = {user_info['id']: [{"task": task['title'], "completed": task[
        'completed'], "username": user_info['username']} for task in todos]}

    # Export to JSON
    file_name = '{}.json'.format(user_info['id'])
    with open(file_name, mode='w') as file:
        json.dump(json_data, file)

    print('Data exported to {}'.format(file_name))
