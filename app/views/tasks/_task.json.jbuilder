json.extract! task, :id, :name, :prioritize, :done, :deadline, :project_id, :created_at, :updated_at
json.url task_url(task, format: :json)
