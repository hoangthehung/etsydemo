module ListingsHelper
	def translateListing(listing, lang)
        if listing == nil
          return nil;
        end
        puts "****Translate***"
        EasyTranslate.api_key = 'AIzaSyBDK3BQBXkxnMU38mgyf7iW0Wuq1JeIu6U'
		# langDe = EasyTranslate.detect(listing.name);
		nameTrans = EasyTranslate.translate(listing.name, :to => lang)
		descriptionTrans = EasyTranslate.translate(listing.description, :to => lang)
		puts nameTrans
        result = listing
       	result.name = nameTrans
       	result.description = descriptionTrans
        return result
      end
end
