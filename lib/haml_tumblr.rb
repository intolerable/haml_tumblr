require 'sass'

def render( partial )
  haml_concat Haml::Engine.new(File.read "partials/_#{partial.to_s}.haml" ).render(self)
end
  
def tab
  tab_up
    yield
  tab_down
end

def sass_tag( sass_file )
  haml_tag :style, :type => 'text/css' do
    haml_concat Sass::Engine.new(File.read "#{sass_file.to_s}.sass").render
  end
end

def scss_tag( sass_file )
  haml_tag :style, :type => 'text/css' do
    haml_concat Sass::Engine.new(File.read "#{sass_file.to_s}.scss").render
  end
end

def tumblr_tag( tag )
  if block_given?
    haml_concat "{block:#{tag.to_s.capitalize}}"
    tab do
      yield
    end
    haml_concat "{/block:#{tag.to_s.capitalize}}"
  else
    haml_concat "{#{tag.to_s.capitalize}}"
  end
end

def tumblr_link_tag( tag )
  "{#{tag.to_s.capitalize}}"
end
