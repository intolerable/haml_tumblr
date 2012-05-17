class Tumblr

  def self.tag( symbol )
    if block_given?
      "{block:#{process symbol}}" + 
      tab { yield } + 
      "{/block:#{process symbol}}"
    else
      "{#{process symbol}}"
    end
  end
  
  # private
  
  def self.tab
    yield.each_line.map { |line|
      "  " + line
    }.join("\n")
  end
  
  def self.process( symbol )
    symbol.to_s.split("_").map(&:capitalize).join
  end

end
