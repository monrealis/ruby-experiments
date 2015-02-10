require 'rexml/document'
include REXML

module XmlVisLib
  class XmlVisualizer
    def initialize(xml)
      @document = Document.new(xml)
    end
  end
end
