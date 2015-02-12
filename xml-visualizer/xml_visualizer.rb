require 'rexml/document'
include REXML

module XmlVisLib
  class XmlVisualizer
    def initialize(xml)
      @document = Document.new(xml)
    end

    def visualize
      c = ElementsCollector.new @document
      elements = c.collect.items
      elements.join '\n'
    end
  end

  class ElementsCollector
    def initialize(root)
      @items=[]
      @root = root
    end

    def collect
      @root.children.each do |el|
        iterate el
      end
      self
    end

    def items
      @items
    end

    private

    def iterate(element)
      @items << element.name
      element.children.each do |el|
        iterate el
      end
    end
  end
end
