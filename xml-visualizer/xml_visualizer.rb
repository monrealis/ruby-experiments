require 'rexml/document'
include REXML

module XmlVisLib
  class XmlVisualizer
    def initialize(xml)
      @document = Document.new xml
      @indent = 0
    end

    def visualize
      c = ElementsCollector.new @document
      elements = c.collect.items.map { |i| i.format_name prefix }
      elements.join '\n'
    end

    def indent=(indent)
      @indent = indent
    end

    private
    def prefix
      ' ' * @indent
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

    def format_name(prefix)
      attr = attributes
      attr = ' ' + attr if attr.size > 0
      "#{prefix * level}#{name}#{attr}"
    end

    private
    def name
      @element.name
    end

    def attributes
      array = []
      @element.attributes.each_attribute do |attr|
        name = attr.name
        array << '@' + name unless attr.prefix == 'xmlns' || attr.expanded_name == 'xmlns'
      end
      array.join ' '
    end
  end
end

