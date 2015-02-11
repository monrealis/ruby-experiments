require 'rspec'
require_relative 'xml_visualizer'
include XmlVisLib

describe 'XML visualizer construction' do
  before do
    @xml = '<root />'
  end

  it 'should parse valid XML' do
    parse
  end

  it 'should fail with invalid XML' do
    @xml = '<root>'
    expect { parse }.to raise_exception(ParseException)
  end
end


describe 'XML visualizer visualization' do
  before do
    @xml = '<root />'
  end

  it 'should return root element name if root is the only element' do
    @xml = '<root />'
    parse
    expect(visualize).to eq('root')
  end
end

def visualize
  @visualizer.visualize
end

def parse
  @visualizer = XmlVisualizer.new @xml
end
