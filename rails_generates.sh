rails g scaffold Listing post_id:string post_time:datetime update_time:datetime contact_name:string contact_method:string contact_phone:string contact_email:string title:string body:text price:decimal region:string address:string longitude:decimal latitude:decimal category:string subcategory:string area:string
rails g migration add_url_to_listings url:string

rails g scaffold Filter keywords:string price_low:decimal price_high:decimal location:string subcategory:string category:string area:string

rails g scaffold HitList listing:references filter:belongs_to

rails g scaffold User email:string password:digest avatar_url:string

rails g controller Sessions new create destroy
