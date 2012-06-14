def process( tag )
  tag.to_s.split("_").map(&:capitalize).join
end

def link_to( *args )
  if block_given?
    haml_tag :a, :href => args.first do
      yield
    end
  else
    haml_tag :a, :href => args.last do
      haml_concat args.first
    end
  end
  nil
end
  
def tab
  tab_up
    yield
  tab_down
end
