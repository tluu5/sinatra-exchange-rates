require "sinatra"
require "sinatra/reloader"
require "http"
require "json"

get("/") do
  api_url = "https://api.exchangerate.host/list?access_key=#{ENV["EXCHANGE_RATE_KEY"]}"
  raw_data = HTTP.get(api_url)
  raw_data_string = raw_data.to_s
  @parsed_data = JSON.parse(raw_data_string)
  
  erb(:homepage)
end
