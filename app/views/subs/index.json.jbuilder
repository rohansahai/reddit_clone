json.array!(@subs) do |sub|
  json.extract! sub, :id, :user_id, :title
  json.url sub_url(sub, format: :json)
end
