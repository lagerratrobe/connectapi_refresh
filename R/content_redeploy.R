# content_redeploy.R

library(connectapi)
library(dplyr)
library(rsconnect)

client <- connect(
  server = 'http://3.144.138.21',
  api_key = 'B9PVO8wPmSyh5WL2RiYb84tc8ijdvP2w'
)

# get all content
all_content <- get_content(client, limit = Inf)
all_content %>% select(title, name, guid) %>% filter(title == "epoch_refresh")

# title         name           guid                                
# epoch_refresh epoch_refresh4 85a893c9-8071-4a7c-b0d4-21a86f1fa978

my_guid <- filter(all_content, title == "epoch_refresh")$guid

# Build a manifest.json
rsconnect::writeManifest("./R")

# Build a bundle
bnd <- bundle_dir("./R")

# Update the report in place
client %>%
  deploy(bnd, guid = my_guid) %>%
  poll_task()
