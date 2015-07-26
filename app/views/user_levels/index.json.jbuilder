json.array!(@user_levels) do |user_level|
  json.extract! user_level, :id, :level, :is_admin
  json.url user_level_url(user_level, format: :json)
end
