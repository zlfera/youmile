task gg: :environment do
  require 'http'
  require 'json'
def a
  #u = 'http://123.127.88.167:8888/tradeClient/observe/requestList'
  begin
  uu = 'http://123.127.88.167:8888/tradeClient/observe/requestList?speciaINo='
  uuu = 'http://123.127.88.167:8888/tradeClient/observe/specialList'
  #dq = Nokogiri::HTML(open(uuu, read_timeout: 5), nil, 'utf-8')
  dq = HTTP.get(uuu).to_s
  #dqq = JSON.parse(dq.text)
  dqq = JSON.parse(dq)
  if dqq[0].nil?
    dqqq = ''
  else
  dqqq = dqq[0]['specialNo']
  end
  u = uu + dqqq
  #d = Nokogiri::HTML(open(u, read_timeout: 5), nil, 'utf-8')
  d = HTTP.get(u).to_s
  #dd = JSON.parse(d.text)
  dd = JSON.parse(d)
  dddd = dd['status']
  ddd = dd['rows']
  [dddd, ddd, dqq]
  rescue
  retry
  end
end

loop do
  sleep 0.3
  m, n, x = a
  if x.empty?
    p m
    p n
    p x
    break
  else
    if n.nil?
      a
    else
      n.each do |d|
        if d['remainSeconds'].to_i < 2
          if d['requestAlias'].nil?
            y = '13'
          else
            y = d['requestAlias'][11] + d['requestAlias'][12]
          end
          t = '拍卖'
          #if d['currentPrice'] == '0'
           # next
          #else
            g = Grain.new(market_name: 'guojia', mark_number: d['requestAlias'], year: y, variety: d['varietyName'], grade: d['gradeName'], trade_amount: d['num'], starting_price: d['basePrice'], latest_price: d['currentPrice'], address: d['requestBuyDepotName'], status: d['statusName'], trantype: t)
            g.save
          #end
        else
          next
        end
      end
    end
  end
end
end
