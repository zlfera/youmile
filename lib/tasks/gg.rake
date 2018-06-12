task gg: :environment do
  require 'open-uri'
  require 'json'
def a
  u = 'http://123.127.88.167:8888/tradeClient/observe/requestList'
  uu='http://36.33.35.40:8888/tradeClient/observe/requestList?speciaINo=1418'
  uuu='http://123.127.88.167:8888/tradeClient/observe/specialList'
d=Nokogiri::HTML(open(u),nil,'utf-8')
dd=JSON.parse(d.text)
dddd=dd['status']
ddd=dd['rows']
[dddd,ddd]
end
loop do
  m,n=a
  if m=='no'
    pp 'ok'
    break
  else
if n==nil
a
else
n.each do |d|
if d['remainSeconds'].to_i == 0
  if m=='yes'
    y=d['requestAlias'][11]+d['requestAlias'][12]
  else
    y='13'
  end
g = Grain.new(market_name: 'guojia', mark_number: d['requestAlias'], year: y, variety: d['varietyName'], grade: d['gradeName'], trade_amount: d['num'], starting_price: d['basePrice'], latest_price: d['currentPrice'], address:d['requestBuyDepotName'], status: d['statusName'], trantype: '拍卖')
g.save
else
a
end
end
end
end
end
end
