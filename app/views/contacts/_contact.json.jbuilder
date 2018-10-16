json.extract! contact, :id, :fname, :lname, :email, :phone, :attendance, :growgroup, :growgroupleader, :dreamteam, :dreamteamleader, :details, :created_at, :updated_at
json.url contact_url(contact, format: :json)
