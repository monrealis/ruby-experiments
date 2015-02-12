require 'rexml/document'
include REXML

module XmlVisLib
  class XmlVisualizer
    def initialize(xml)
      @document = Document.new(xml)
    end

    def visualize
      c = ElementsCollector.new (@document.children)
      elements = c.collect.items
      elements.join '\n'
    end
  end

  class ElementsCollector
    def initialize(elements)
      @items=[]
      @elements = elements
    end

    def collect
      @elements.each do |el|
        @items << el.name
      end
      self
    end

    def items
      @items
    end
  end
end
