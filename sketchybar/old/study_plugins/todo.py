from todoist_api_python.api import TodoistAPI as tapi
api = tapi('api token')
try:
    tasks = api.get_tasks()
    print(len(tasks))
except Exception as err:
    print(err)
