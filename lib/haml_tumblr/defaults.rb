def render_defaults( format = :sass )
  Tumblr.variables ||= {:color => {}, :font => {}}
  [:font, :color].map { |type|
    Tumblr.variables[type].each_pair.map { |key, value|
      "$#{key}: unquote( \"{#{type}:#{process key}}\" )"
    }
  }.flatten.map { |string|
    format == :scss ? string + ";" : string
    }.join("\n") + "\n"
end

def default_colors( hash )
  hash.each_pair.map { |key, val|
    Tumblr.variables[:color][key.to_s] = val
    capture_haml { haml_tag :meta, :name => "color:#{process key}", :content => val }
  }.join
end

def default_fonts( hash )
  hash.each_pair.map { |key, val|
    Tumblr.variables[:font][key.to_s] = val
    capture_haml { haml_tag :meta, :name => "font:#{process key}", :content => val }
  }.join
end
