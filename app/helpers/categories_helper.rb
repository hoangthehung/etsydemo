module CategoriesHelper
	def getListByCate(category)
        if category == nil
          return nil;
        end
        puts "****getListByCate***"
        puts category.name
        result = category.listings
        category.children.each do |cate|
          child =  getListByCate(cate)
          if child != nil
            result = result + child
          end
        end
        return result
      end
end
