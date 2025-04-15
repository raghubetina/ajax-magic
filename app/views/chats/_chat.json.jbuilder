json.extract! chat, :id, :subject, :created_at, :updated_at
json.url chat_url(chat, format: :json)
