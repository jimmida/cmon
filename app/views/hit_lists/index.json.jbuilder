json.array!(@hit_lists) do |hit_list|
  json.extract! hit_list, :id, :listing_id, :filter_id
  json.url hit_list_url(hit_list, format: :json)
end
