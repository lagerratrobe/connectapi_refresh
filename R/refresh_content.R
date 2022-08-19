# Note that you will need the GUID for the report.  This can be found in the Connect
# Admin console as part of the Content URL, or via the connectapi::get_content() function.
# Content URL = http://3.144.138.21/content/85a893c9-8071-4a7c-b0d4-21a86f1fa978

library(connectapi)

client <- connect(
  server = 'http://3.144.138.21',
  api_key = 'B9PVO8wPmSyh5WL2RiYb84tc8ijdvP2w'
)

# Get the Connect object for this report
my_content <- content_item(client, guid = "85a893c9-8071-4a7c-b0d4-21a86f1fa978")

# Update in place
deploy_current(my_content)


