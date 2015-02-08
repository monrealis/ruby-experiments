require 'net/http'
require 'uri'

uri = URI.parse('http://www.delfi.lt')
response = Net::HTTP.get_response(uri)
text = response.body
counts = text.split('').grep('0'..'9').group_by { |c| c }.map { |char, chars| [char, chars.count] }
total = counts.map { |_, v| v }.reduce { |i, j| i + j }
counts.sort.each do |char, chars|
  percent = 100.0 * chars/total
  p = '%.2f' % percent
  puts "#{char}: #{chars}/#{total} (#{p}%)"
end
