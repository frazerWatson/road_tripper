json.array!(@comments) do |comment|
  json.extract! comment, :id, :remark
  json.url comment_url(comment, format: :json)
end
