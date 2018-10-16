json.extract! image, :id, :image, :title, :caption, :created_at, :updated_at
json.url image_url(image, format: :json)
