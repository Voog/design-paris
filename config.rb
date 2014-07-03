#STANDARD RUBY CONFIG FILES SETTINGS FOR COMMAND LINE COMPASS WATCH
environment = :development
firesass = false

css_dir         = "stylesheets"
sass_dir        = "stylesheets/sass"
extensions_dir  = "sass-extensions"
images_dir      = "images"
javascripts_dir = "js"

output_style = :expanded

relative_assets = true


#PREPROS SETTINGS FOR MUTIPLE OUTPUTS
require 'fileutils'

on_stylesheet_saved do |file|
  if file.match('.min') == nil
    require 'compass'

    Compass.add_configuration(
        {
            :css_dir => "css.min",
            :sass_dir => "sass",
            :output_style => :compressed
        },
        'min' #ADDING A CONFIG REQUIRES A NAME
    )
    Compass.compiler.compile('sass/Master.scss', 'css.min/Master.css')

  end
end
