# Craigslist Monitor
* Cron job to pull listings
* Cron job to apply filters to listings
* Save listings into databases

## Models
* Users: stores user information
* Listings: individual records of Craigslist posts
* Filters: user-created criteria to select listings
* HitLists: join table between Listings and Filters

## Relationships
* A user has many filters
* A filter has many posts
* A post belongs to many filters

