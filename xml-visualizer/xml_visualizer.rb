require 'rexml/document'
include REXML

module XmlVisLib
  class XmlVisualizer
    def initialize(xml)
      @document = Document.new xml
    end

    def visualize
      c = ElementsCollector.new @document
      elements = c.collect.items
      elements.join '\n'
    end
  end

  class ElementsCollector
    attr_reader :items

    def initialize(root)
      @items=[]
      @root = root
    end

    def collect
      iterate_children(@root)
      self
    end

    private

    def iterate_children(parent)
      parent.children.each do |el|
        iterate el
      end
    end

    def iterate(element)
      @items << element.name
      iterate_children(element)
    end
  end
end

