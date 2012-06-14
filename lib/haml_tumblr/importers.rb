def coffee_tag( coffee_file )
  require 'coffee-script'
  capture_haml do
    haml_tag :script, :type => 'text/javascript' do
      haml_concat CoffeeScript.compile File.read "#{coffee_file.to_s}.coffee"
    end
  end
end

def jquery_tag( version = "1.7.2" )
  capture_haml { haml_tag :script,
    :type => 'text/javascript',
    :src => 'http://ajax.googleapis.com/ajax/libs/jquery/#{version}/jquery.min.js' }
end

def sass_tag( sass_file )
  require 'sass'
  full_sass = render_defaults(:sass) + (File.read "#{sass_file.to_s}.sass")
  capture_haml {
    haml_tag :style, :type => 'text/css' do
      haml_concat Sass::Engine.new(full_sass).render
    end
  }
end

def scss_tag( scss_file )
  require 'sass'
  full_sass = render_defaults(:scss) + (File.read "#{scss_file.to_s}.sass")
  capture_haml {
    haml_tag :style, :type => 'text/css' do
      haml_concat Sass::Engine.new(full_sass).render
    end
  }
end
