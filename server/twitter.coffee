Twit          = require('twit')
credentials   = require './credentials.coffee'

#
# Boundingbox filter with latitude and longitude data.
#
boundingBoxGermany = [
  5.86
  47.27
  15.05
  55.06
] 

client = new Twit
  consumer_key:         credentials.twitter.consumer_key
  consumer_secret:      credentials.twitter.consumer_secret
  access_token:         credentials.twitter.access_token
  access_token_secret:  credentials.twitter.access_token_secret

exports.stream = client.stream "statuses/filter", locations: boundingBoxGermany

