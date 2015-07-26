json.array!(@work_sessions) do |work_session|
  json.extract! work_session, :id, :start, :end, :project_id
  json.url work_session_url(work_session, format: :json)
end
