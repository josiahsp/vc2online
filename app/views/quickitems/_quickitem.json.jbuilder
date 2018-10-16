json.extract! quickitem, :id, :title, :path, :order, :created_at, :updated_at
json.url quickitem_url(quickitem, format: :json)
