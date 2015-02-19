require 'rspec'
require_relative 'xml_visualizer'
include XmlVisLib

describe 'XML visualizer construction' do
  before do
    @xml = '<root />'
    @indent = 0
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
    @indent = 0
  end

  it 'should return root element name if root is the only element' do
    @xml = '<root />'
    parse
    expect(visualize).to eq('root')
  end

  it 'should visualize attribute name' do
    @xml = '<root attr="value"/>'
    parse
    expect(visualize).to eq('root @attr')
  end

  it 'should handle element with namespace and without prefix' do
    @xml = '<root xmlns="urn:eu.vytenis.test:test" />'
    parse
    expect(visualize).to eq('root')
  end

  it 'should handle element with namespace and prefix' do
    @xml = '<t:root xmlns:t="urn:eu.vytenis.test:test" />'
    parse
    expect(visualize).to eq('root')
  end

  it 'should return all elements, each element on a new line' do
    @xml = '<root><one><two /></one><three /></root>'
    parse
    expect(visualize).to eq('root\none\ntwo\nthree')
  end

  it 'should return all elements with indentation if indentation is not 0' do
    @indent = 2
    @xml = '<root><one><two /></one><three /></root>'
    parse
    expect(visualize).to eq('root\n  one\n    two\n  three')
  end
end

def visualize
  @visualizer.visualize
end

def parse
  @visualizer = XmlVisualizer.new @xml
  @visualizer.indent =@indent
end
