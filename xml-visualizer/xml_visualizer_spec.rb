require 'rspec'
require_relative 'xml_visualizer'
include XmlVisLib

describe 'XML visualizer' do
  before do
    @xml = '<root />'
  end

  it 'should parse valid XML' do
    parse
  end

  def parse
    XmlVisualizer.new @xml
  end

  it 'should fail with invalid XML' do
    @xml = '<root>'
    expect { parse }.to raise_exception(ParseException)
  end
end
