require 'rexml/document'
include REXML

module XmlVisLib
  class XmlVisualizer
    def initialize(xml)
      @document = Document.new(xml)
    end

    def visualize
      elements = []
      @document.children.each do |el|
        elements << el.name
      end
      elements.join '\n'
    end
  end
end
