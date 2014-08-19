json.array!(@filters) do |filter|
  json.extract! filter, :id, :keywords, :price, :location, :subcategory, :category, :area
  json.url filter_url(filter, format: :json)
end
