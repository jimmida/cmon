namespace :fetch do

  desc "Download the latest housing listings"
  task hhh: :environment do
    def digest(doc, url)
      digested = {}

      infos = doc.xpath('//div[@class="postinginfos"]/p[@class="postinginfo"]')
      infos.each do |info|
        if info.content.include? 'posted'
          digested['post_time'] = info.xpath('./time').first.attr('datetime')
        elsif info.content.include? 'updated'
          digested['update_time'] = info.xpath('./time').first.attr('datetime')
        end
      end

      replylink = doc.xpath('//a[@id="replylink"]').first
      if replylink
        contact_path = replylink.attr('href')
        uri      = URI.parse(url)
        uri.path = contact_path
        response = RestClient.get uri.to_s
        contact_info = Nokogiri::HTML(response)
        contact_info.xpath('//div[@class="reply_options"]').children.each do |child|
          if child.content.include? 'contact name'
            digested['contact_name'] = child.next_sibling.content.strip
          elsif child.content.include? 'contact method'
            digested['contact_method'] = child.next_sibling.content.strip
          elsif child.content.include? 'by phone'
            phone_str = child.next_sibling.content
            digested['contact_phone'] = phone_str.chars.select(&:ascii_only?).join.strip
          elsif child.content.include? 'by email'
            digested['contact_email'] = child.next_sibling.content.strip
          end
        end
      end

      digested['body'] = doc.xpath('//section[@class="userbody"]').first.to_s

      address = doc.xpath('//div[@class="mapbox"]/div[@class="mapaddress"]').first
      longlat = doc.xpath('//div[@id="map"]').first
      digested['address']   = address.content if address
      digested['latitude']  = longlat.attr('data-latitude') if longlat
      digested['longitude'] = longlat.attr('data-longitude') if longlat

      digested
    end


    url    = "https://www.kimonolabs.com/api/cncwxk8k"
    apikey = "apikey=7rNSQ3bW7Er9SpBeXC3M18iFx2FdGApG"

    response = RestClient.get "#{url}?#{apikey}"
    json = JSON.parse(response.body)
    puts json['name']
    json['results']['hhh'].each do |item|
      # can use threads to grab each link
      url      = item['title']['href']
      begin
        response = RestClient.get url
      rescue RestClient::ResourceNotFound
        puts "Listing not found: #{url}\n"
        next
      end
      doc      = Nokogiri::HTML(response)
      digested = digest(doc, url)
      html = doc.xpath('//section[@id="postingbody"]')

      listing = Listing.new

      listing.url         = url
      listing.post_id     = /.*\/(\d+).html/.match(url)[1]
      listing.post_time   = digested['post_time']
      listing.update_time = digested['update_time']

      listing.contact_name   = digested['contact_name']
      listing.contact_method = digested['contact_method']
      listing.contact_phone  = digested['contact_phone']
      listing.contact_email  = digested['contact_email']

      listing.title = item['title']['text']
      listing.body  = digested['body']
      listing.price = /([\d.]+)/.match(item['price'])[1] unless item['price'].empty?

      listing.region    = item['region']
      listing.address   = digested['address']
      listing.latitude  = digested['latitude']
      listing.longitude = digested['longitude']

      listing.subcategory = item['category']['text']
      listing.category    = 'hhh'
      listing.area        = 'sfbay'

      listing.active      = true

      unless listing.save
        puts listing.errors.full_messages
        puts listing.url
        puts
      end
      # puts listing.post_id, listing.url, listing.title, listing.price
      # puts
    end
  end

end