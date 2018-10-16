json.extract! location, :id, :title, :building, :address, :address2, :city, :state, :zip, :phone, :leader, :created_at, :updated_at
json.url location_url(location, format: :json)
