require 'rspec'

describe 'Contains method' do
  before do
    @list = [*1..3]
  end
  it 'should return true if value is in the list' do
    expect(@list.include? 3).to eq(true)
  end
  it 'should return false if value is not in the list' do
    expect(@list.include? 4).to eq(false)
  end
end