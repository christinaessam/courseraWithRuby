json.array!(@courses) do |course|
  json.extract! course, :id, :title, :image, :describtion, :user_id
  json.url course_url(course, format: :json)
end
