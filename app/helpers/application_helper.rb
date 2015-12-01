module ApplicationHelper
	def subcat_prefix(depth)
  		("&nbsp;" * 4 * depth).html_safe
 	end

 	def category_options_array(current_id = 0,categories=[], parent_id=0, depth=0)
 		 Category.where('parent_id = ? AND id != ?', parent_id, current_id ).order(:id).each do |category|
      	categories << [subcat_prefix(depth) + category.name, category.id]
      	category_options_array(current_id,categories, category.id, depth+1)
  		end
  		categories
	end
end
