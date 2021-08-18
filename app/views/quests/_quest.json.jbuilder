json.extract! quest, :id, :title, :description, :meeting_link, :meeting_held_at, :started_at, :finished_at, :created_at, :updated_at
json.url quest_url(quest, format: :json)
