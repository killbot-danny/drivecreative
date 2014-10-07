###
# Compass
###

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

# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", :locals => {
#  :which_fake_page => "Rendering a fake page with a local variable" }

###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Reload the browser automatically whenever files change
configure :development do
  activate :livereload
end

# Methods defined in the helpers block are available in templates
helpers do
  def person(options)
    data_path = options[:double_line] ? 'm 180,56 -180,0 L 0,0 180,0 z' : 'm 180,34.57627 -180,0 L 0,0 180,0 z'

    haml_tag :a, href: "mailto:#{options[:email]}", :'data-path-hover' => data_path do
      haml_tag :figure do
        haml_tag :img, src: options[:image]
        haml_tag :svg, viewBox: '0 0 180 320', preserveAspectRatio: 'none' do
          haml_tag :path, d: 'M 180,160 0,218 0,0 180,0 z'
        end
        haml_tag :figcaption do
          haml_tag :h3, options[:name]
          haml_tag :h4, options[:position]
          haml_tag :span, class: 'button' do
            haml_concat 'Email'
          end
        end
      end
    end
  end
end

set :css_dir, 'stylesheets'

set :js_dir, 'javascripts'

set :images_dir, 'images'

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  # activate :minify_css

  # Minify Javascript on build
  # activate :minify_javascript

  # Enable cache buster
  # activate :asset_hash

  # Use relative URLs
  # activate :relative_assets

  # Or use a different image path
  # set :http_prefix, "/Content/images/"
end
