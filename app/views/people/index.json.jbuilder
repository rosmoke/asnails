json.array!(@people) do |person|
  json.extract! person, :id, :name, :email, :login
  json.url person_url(person, format: :json)
end
