module LinksHelper
	def self.parseURL(str)
		link = Link.new;
		link.url = str;
		parseLink(link)
	end
	def parseLink(link)
		doc = Nokogiri::HTML(open(link.url, "User-Agent" => "Ruby/#{RUBY_VERSION}"))
		values = link.url.split("/")
		original = values[2].sub(/(www.)/i, "")  
		provider = Provider.find_by_name(original)
		if (provider.nil?)

		end
		link.update(provider_id: provider.id)
		

		puts original
		puts link.id
		  
		case original
		  when 'lazada.vn'
		    return parseLazada(doc, link)
		  when 'amazon.com'
		    return parseAmazon(doc,link)
		  when 'ebay.com'
		    return parseEbay(doc,link)
		  else
		    puts link.url
		end
	end

private
	def parseEbay(doc, link)
		puts "**********	Ebay 	*****************"
		imgLink = doc.at_css('#icImg')['src'].strip
		nameLink = doc.at_css('#itemTitle').text.strip[15..-1]
		desLink = doc.at_css('.section').text.strip
		priceLink = doc.at_css('#prcIsum').text.partition('$').last
		puts nameLink
		puts imgLink
		puts desLink
		listing = Listing.new(name: nameLink,description: desLink, price: priceLink, image: imgLink, user_id: current_user.id, linkId: link.id)
		listing.save!
		puts "*******************************"
		return listing
	end 
	def parseLazada(doc, link)
		puts "*******************************"
		    imgLink = doc.css(".product-image-container").at_css("img")['src'].strip
		    nameLink = doc.at_css('.product-info-name').text.strip
		    priceLink = doc.at_css('.product-prices').text.split("\n").second.gsub(/[^\d]/, '')
		    desDetail = doc.css(".description-detail")
		    if (desDetail.css("p").first != nil)
		      desLink = desDetail.css("p").first.text;
		    end
		      desLink = desDetail.text.split("\n")[-2];
		    
		     
		    listing = Listing.new(name: nameLink,description: desLink, price: priceLink, image: imgLink, user_id: current_user.id, linkId: link.id)
		    listing.save!
		    puts "*******************************"
		    EasyTranslate.api_key = 'AIzaSyBDK3BQBXkxnMU38mgyf7iW0Wuq1JeIu6U'
		    lang = EasyTranslate.detect (nameLink);
		    nameEn = EasyTranslate.translate(nameLink, :to => :en)
		    puts lang
		    puts nameEn
		    # post FB
		    access_token = session['facebook_access_token']
		    puts access_token
		    puts "*******************************"
		    facebook = Koala::Facebook::API.new(access_token)
		    listing_url = listing_url(listing);
		    facebook.put_wall_post(nameLink, {
		    "name" => nameLink,
		    "link" => listing_url,
		    "caption" => nameLink,
		    "description" => desLink,
		    "picture" => imgLink})
		    #facebook.put_connections("me", "feed", :name => nameLink, :message=> desDetail, :picture => imgLink, :link => listing_url)
		return listing
	end
	def parseAmazon(doc, link)
		puts "*******************************"
		    imgLink = doc.at_css('#imgTagWrapperId img')['src'].strip
		    nameLink = doc.at_css('#productTitle').text.strip
		    priceLink = doc.at_css('#priceblock_ourprice').text.gsub(/[^\d]/, '')
		    desLink = doc.at_css('#productDescription p').text
		    
		    puts nameLink
		    puts desLink
		    puts imgLink
		    puts priceLink
		    
		    
		    listing = Listing.new(name: nameLink,description: desLink, price: priceLink, image: imgLink, user_id: current_user.id, linkId: link.id)
		    listing.save!
		    puts "*******************************"
		    # post FB
		    access_token = session['facebook_access_token']
		    puts access_token
		    puts "*******************************"
		    facebook = Koala::Facebook::API.new(access_token)
		    listing_url = listing_url(listing);
		    facebook.put_wall_post(nameLink, {
		    "name" => nameLink,
		    "link" => listing_url,
		    "caption" => nameLink,
		    "description" => desLink,
		    "picture" => imgLink})
		    return listing
	end
end
