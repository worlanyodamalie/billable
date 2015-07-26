json.array!(@projects) do |project|
  json.extract! project, :id, :client_id, :name
  json.url project_url(project, format: :json)
end
