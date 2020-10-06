# class AjaxWillPaginate < WillPaginate::LinkRenderer
#   def prepare(collection, options, template)
#     @update = options[:update]
#     super
#   end
#   protected
#   def page_link(page, text, attributes = {})
#     @template.link_to_remote(text, {
#       :url     => url_for(page),
#       :method  => :get,
#       :update => @update
#     })
#   end
# end
