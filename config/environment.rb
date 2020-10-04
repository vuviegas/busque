# Load the Rails application.
require_relative 'application'
require 'will_paginate'

# Initialize the Rails application.
Rails.application.initialize!

WillPaginate::ViewHelpers.pagination_options[:renderer] = 'AjaxWillPaginate'

