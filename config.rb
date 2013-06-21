###
# Blog settings
###

# Time.zone = "UTC"
Time.zone = "CET"

# Blog
activate :blog do |blog|
  blog.prefix = "blog"
  blog.permalink = ":year/:month/:day/:title.html"
  blog.sources = ":year-:month-:day-:title.html"
  # blog.taglink = "tags/:tag.html"
  blog.layout = "blog"
  # blog.summary_separator = /(READMORE)/
  # blog.summary_length = 250
  blog.paginate = true
  blog.page_link = "p:num"
  blog.per_page = 5
  # blog.year_link = ":year.html"
  # blog.month_link = ":year/:month.html"
  # blog.day_link = ":year/:month/:day.html"
  blog.default_extension = ".markdown.erb"
  blog.tag_template = "tag.html"
  blog.calendar_template = "calendar.html"
end

# RSS Feed
page "/feed.xml", :layout => false

# Enable Pretty URL's
activate :directory_indexes

# Enable markdown
set :markdown_engine, :kramdown
set :markdown, :layout_engine => :erb, 
               :tables => true, 
               :autolink => true,
               :smartypants => true

# Enable GZIP compression
activate :gzip

# Syntax
activate :syntax

# Sprockets
activate :sprockets

# Breadcrumbs
require "lib/breadcrumbs"
helpers Breadcrumbs

# Sitemap.xml
require 'builder'
page "/sitemap.xml", :layout => false
page "/sitemap.html", :layout => false

# Bing
page "/BingSiteAuth.xml", :layout => false

### 
# Compass
###

# Susy grids in Compass
# First: gem install susy
# require 'susy'

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
# 
# With no layout
# page "/path/to/file.html", :layout => false
# 
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
# 
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy (fake) files
# page "/this-page-has-no-template.html", :proxy => "/template-file.html" do
#   @which_fake_page = "Rendering a fake page with a variable"
# end

###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

set :css_dir, 'assets/css'

set :js_dir, 'assets/js'

set :images_dir, 'images'

ignore 'assets/js/license.js'
ignore 'assets/js/bootstrap.js'
ignore 'assets/js/jquery.js'
ignore 'assets/js/lightbox.js'

ignore 'assets/css/bootstrap.css'
ignore 'assets/css/bootstrap-responsive.css'
ignore 'assets/css/lightbox.css'

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  activate :minify_css
  
  # Minify Javascript on build
  activate :minify_javascript

  # Minify html
  activate :minify_html
  
  # Enable cache buster
  #activate :cache_buster
  
  # Use relative URLs
  #activate :relative_assets
  
  # Compress PNGs after build
  # First: gem install middleman-smusher
  # require "middleman-smusher"
  # activate :smusher
  
  # Or use a different image path
  # set :http_path, "/Content/images/"
end
