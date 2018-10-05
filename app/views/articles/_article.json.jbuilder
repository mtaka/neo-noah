json.extract! article, :id, :title, :subtitle, :url, :abstract, :description, :created_at, :updated_at
json.url article_url(article, format: :json)
