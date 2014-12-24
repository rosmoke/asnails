json.array!(@news) do |news|
  json.extract! news, :id, :title, :content, :img_url, :votes
  json.url news_url(news, format: :json)
end
