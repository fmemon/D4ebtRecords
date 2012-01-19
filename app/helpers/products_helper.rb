module ProductsHelper
 def display_search_found(products, term, found)
   #if !term.empty? && found
   if !term.blank? && found
     pluralize(products.count, 'entry') + " found for '" + term + "'"
   end
 end
end
