json.extract! quest, :id, :title, :description, :time_limit, :started_at, :created_at, :updated_at
json.url quest_url(quest, format: :json)
