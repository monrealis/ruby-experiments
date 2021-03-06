require 'rexml/document'
include REXML

module XmlVisLib
  class XmlVisualizer
    def initialize(xml)
      @document = Document.new xml
    end

    def visualize
      c = ElementsCollector.new @document
      elements = c.collect.items.map { |i| i.name }
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
      iterate_children(@root, 0)
      self
    end

    private

    def iterate_children(parent, level)
      parent.children.each do |el|
        iterate el, level
      end
    end

    def iterate(element, level)
      @items << ElementItem.new(element, level)
      iterate_children(element, level + 1)
    end
  end

  class ElementItem
    attr_reader :element, :level

    def initialize(element, level)
      @element = element
      @level = level
    end

    def name
      @element.name
    end
  end
end

