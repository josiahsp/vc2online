json.extract! kioskitem, :id, :title, :path, :cover_image, :starttime, :endtime, :active, :created_at, :updated_at
json.url kioskitem_url(kioskitem, format: :json)
