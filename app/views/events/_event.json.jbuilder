json.extract! event, :id, :title, :subtitle, :synopsis, :content, :location, :location_building, :location_address, :location_address2, :location_city, :location_state, :location_zip, :location_googlemapsid, :start, :end, :videos, :images, :links, :price, :created_at, :updated_at
json.url event_url(event, format: :json)
