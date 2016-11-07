json.extract! post, :id, :published, :content, :created_at, :updated_at
json.url post_url(post, format: :json)