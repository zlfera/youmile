task gg: :environment do
  require 'open-uri'
  require 'json'
def a
  u = 'http://123.127.88.167:8888/tradeClient/observe/requestList'
  uu = 'http://36.33.35.40:8888/tradeClient/observe/requestList?speciaINo=1418'
  uuu = 'http://123.127.88.167:8888/tradeClient/observe/specialList'
  dq = Nokogiri::HTML(open(uuu, read_timeout: 5), nil, 'utf-8')
  dqq = JSON.parse(dq.text)
  d = Nokogiri::HTML(open(u, read_timeout: 5), nil, 'utf-8')
  dd = JSON.parse(d.text)
  dddd = dd['status']
  ddd = dd['rows']
  [dddd, ddd, dqq]
end

loop do
  m, n, x = a
  if x.size == 0
    break
  else

  if m == 'no'
    pp 'ok'
    break
  else
    if n.nil?
      a
    else
      n.each do |d|
        if d['remainSeconds'] == '0'
          if m == 'yes'
            y = d['requestAlias'][11] + d['requestAlias'][12]
          else
            y = '13'
          end
          t = '拍卖'
          g = Grain.new(market_name: 'guojia', mark_number: d['requestAlias'], year: y, variety: d['varietyName'], grade: d['gradeName'], trade_amount: d['num'], starting_price: d['basePrice'], latest_price: d['currentPrice'], address: d['requestBuyDepotName'], status: d['statusName'], trantype: t)
          g.save
        else
          a
        end
      end
    end
  end
end
end
end
