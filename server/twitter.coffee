Twit = require('twit')
credentials = require './credentials.coffee'

#
# Boundingbox filter with latitude and longitude data.
#
boundingBox = [
	-180.00
	-90.00
	180.00
	90.00	
]

client = new Twit(
  consumer_key: credentials.twitter.consumer_key
  consumer_secret: credentials.twitter.consumer_secret
  access_token: credentials.twitter.access_token
  access_token_secret: credentials.twitter.access_token_secret
)

exports.stream = client.stream("statuses/filter",
  		locations: boundingBox
		)

