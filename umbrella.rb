#KEYS
#pp ENV.fetch("GMAPS_KEY")
#pp ENV.fetch("PIRATE_WEATHER_KEY")

#original https://maps.googleapis.com/maps/api/geocode/json?address=Merchandise%20Mart%20Chicago&key=REPLACE_THIS_QUERY_STRING_PARAMETER_WITH_YOUR_API_TOKEN


require "http"

pp "Where are you located?"
#userLocation  = "Chicago"
userLocation = gets.chomp


#userLocation = gets.chomp.gsub(" ", "%20")


#pirate_weather_url = "https://api.pirateweather.net/forecast/" +  ENV.fetch("PIRATE_WEATHER_KEY") + "/41.8887,-87.6355"

maps_url = "https://maps.googleapis.com/maps/api/geocode/json?address=" + userLocation + "&key=" + ENV.fetch("GMAPS_KEY")

resp = HTTP.get(maps_url) 
#pp resp


raw_response = resp.to_s
#pp raw_response

require "json"

parsed_response = JSON.parse(raw_response)
#pp parsed_response
#pp parsed_response.keys
lat = parsed_response.fetch("results").at(0).fetch("geometry").fetch("location").fetch("lat")
lng = parsed_response["results"][0]["geometry"]["location"]["lng"]

pp lat
pp lng

pirate_weather_url = "https://api.pirateweather.net/forecast/" +  ENV.fetch("PIRATE_WEATHER_KEY") + "/" + lat.to_s + "," + lng.to_s


pp pirate_weather_url



=begin

# Place a GET request to the URL
raw_response = HTTP.get(pirate_weather_url)

require "json"

parsed_response = JSON.parse(raw_response)

currently_hash = parsed_response.fetch("currently")

current_temp = currently_hash.fetch("temperature")

puts "The current temperature is " + current_temp.to_s + "."

=end
