json.array!(@politicians) do |politician|
  json.extract! politician, :id, :first_name, :last_name, :party, :occupation, :country, :area, :wikipage
  json.url politician_url(politician, format: :json)
end
