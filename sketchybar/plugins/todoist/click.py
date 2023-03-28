from todoist_api_python.api import TodoistAPI
from datetime import datetime
import json

with open("/Users/kutay/.config/info.json", 'r') as f:
    info = json.load(f)

api = TodoistAPI(info["TODOIST_API_TOKEN"])

tasks_today = []
today = datetime.utcnow().strftime("%Y-%m-%d")

for task in api.get_tasks():
    if task.due.date == today:
        tasks_today.append(task)

api.close_task(task_id=tasks_today[0].id)
print(str(len(tasks_today) - 1) + " - " + tasks_today[1].content)
