class AsciiElement
  
  attr_accessor :children, :type
  
  def initialize(type)
    @type = type
    @children = []
  end
  
  def render(views)
    content = ""
    @children.each do |child|
      if(child.is_a? String)
        content += child
      else
        content += child.render(views)
      end
    end
    content
    raise Exception, "Template file doesn't exist: #{@type}" if views[@type].nil?
    views[@type].result(binding)
  end
  
end