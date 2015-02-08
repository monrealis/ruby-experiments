require 'rspec'
require 'rspec/autorun'

describe 'Contains method' do
  before do
    @list = [*1..3]
  end
  it 'should return true if value is in list' do
    expect(@list.include? 3).to eq(true)
  end
  it 'should return true if value is in list' do
    (@list.include? 4).should == false
  end
end