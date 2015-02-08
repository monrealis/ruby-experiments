require 'net/http'
require 'uri'

def get_text
  uri = URI.parse('http://www.delfi.lt')
  response = Net::HTTP.get_response(uri)
  response.body
end

def get_counts(text)
  text.split('').grep('0'..'9').group_by { |c| c }.map { |char, chars| [char, chars.count] }
end

def print_counts(counts)
  total = counts.map { |_, v| v }.reduce { |i, j| i + j }
  counts.sort.each do |char, chars|
    percent = 100.0 * chars/total
    p = '%.2f' % percent
    puts "#{char}: #{chars}/#{total} (#{p}%)"
  end
end


print_counts(get_counts(get_text))
