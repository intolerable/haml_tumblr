def render( partial )
  haml_concat Haml::Engine.new(File.read "partials/_#{partial.to_s}.haml" ).render(self)
end
  
def tab
  tab_up
    yield
  tab_down
end

def coffee_tag( coffee_file )
  require 'coffee-script'
  haml_tag :script, :type => 'text/javascript' do
    haml_concat CoffeeScript.compile File.read "#{coffee_file.to_s}.coffee"
  end
end

def jquery_tag( version = "1.7.2" )
  haml_tag :script,
    :type => 'text/javascript',
    :src => 'http://ajax.googleapis.com/ajax/libs/jquery/#{version}/jquery.min.js'
end

def sass_tag( sass_file )
  require 'sass'
  haml_tag :style, :type => 'text/css' do
    haml_concat Sass::Engine.new(File.read "#{sass_file.to_s}.sass").render
  end
end

def scss_tag( scss_file )
  require 'sass'
  haml_tag :style, :type => 'text/css' do
    haml_concat Sass::Engine.new(File.read "#{scss_file.to_s}.scss").render
  end
end

def tumblr_tag( tag )
  if block_given?
    haml_concat "{block:#{process tag}}"
    tab do
      yield
    end
    haml_concat "{/block:#{process tag}}"
  else
    haml_concat "{#{process tag}}"
  end
end

def tumblr_link_tag( tag )
  "{#{process tag}}"
end

def link_to( text, address )
  haml_tag :a, :href => address do
    haml_concat text
  end
end

private

def process( tag )
  tag.to_s.split("_").map(&:capitalize).join
end
