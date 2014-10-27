require 'open-uri'
require 'json'

# If you experience an error relating to SSL,
#   uncomment the following two lines:

require 'openssl'
OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

puts "Let's get the weather forecast for your address."

puts "What is the address you would like to know the weather for?"
the_address = gets.chomp
url_safe_address = URI.encode(the_address)

# Your code goes below.
url_safe_address = URI.encode(the_address)
url_of_data_we_want = "http://maps.googleapis.com/maps/api/geocode/json?address="+url_safe_address

raw_data = open(url_of_data_we_want).read
parsed_data=JSON.parse(raw_data)
the_latitude=parsed_data["results"][0]["geometry"]["location"]["lat"]
the_longitude=parsed_data["results"][0]["geometry"]["location"]["lng"]

url="https://api.forecast.io/forecast/87652b49ea0aab2e0e8221bb03c20dba/#{the_latitude},#{the_longitude}"
raw_data=open(url).read
parsed_data=JSON.parse(raw_data)
the_temperature=parsed_data["currently"]["temperature"]
the_hour_outlook=parsed_data["hourly"]["data"][1]["summary"]
the_day_outlook=parsed_data["daily"]["data"][1]["summary"]
# Ultimately, we want the following line to work when uncommented:

puts "The current temperature at #{the_address} is #{the_temperature} degrees."
puts "The outlook for the next hour is: #{the_hour_outlook}"
puts "The outlook for the next day is: #{the_day_outlook}"
