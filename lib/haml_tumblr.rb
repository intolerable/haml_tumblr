$LOAD_PATH << File.dirname(__FILE__)

require 'haml_tumblr/defaults'
require 'haml_tumblr/helpers'
require 'haml_tumblr/importers'

def render( partial )
  Haml::Engine.new(File.read "partials/_#{partial.to_s}.haml" ).render(self)
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

def tumblr( tag )
  if block_given?
    haml_concat "{block:#{process tag}}"
    tab do
      yield
    end
    haml_concat "{/block:#{process tag}}"
    nil
  else
    "{#{process tag}}"
  end
end

module Tumblr
  @@sass_variables = {:color => {}, :font => {} }
  
  def self.variables
    @@sass_variables
  end
  
end
