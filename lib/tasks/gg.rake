task gg: :environment do
  require 'open-uri'
  require 'json'
def a
  u = 'http://123.127.88.167:8888/tradeClient/observe/requestList'
d=Nokogiri::HTML(open(u),nil,'utf-8')
dd=JSON.parse(d.text)
ddd=dd['rows']
end
loop do
if a==nil
a
else
a.each do |i|
if i['remainSeconds'].to_i == 0
g = Grain.new(market_name: market_name, mark_number: d[1], year: d[2], variety: d[3], grade: d[4], trade_amount: d[5].delete(','), starting_price: d[6].delete(','), latest_price: d[7].delete(','), address:d[9], status: d[11], trantype: d[13])
else
a
end
end
end
end
end
