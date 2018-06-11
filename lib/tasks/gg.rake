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
a.each do |d|
if d['remainSeconds'].to_i == 0
g = Grain.new(market_name: '国家交易平台', mark_number: d['requestAlias'], year: d[2], variety: d['varietyName'], grade: d['gradeName'], trade_amount: d['num'], starting_price: d['basePrice'], latest_price: d['currentPrice'], address:d['requestBuyDepotName'], status: d['statusName'], trantype: '拍卖')
g.save
else
a
end
end
end
end
end
