json.extract! photo, :id, :name, :description, :priority, :invention_id, :media, :created_at, :updated_at
json.url photo_url(photo, format: :json)