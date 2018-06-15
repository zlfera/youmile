# frozen_string_literal: true

task gg: :environment do

  def a
    begin
      uu = 'http://123.127.88.167:8888/tradeClient/observe/requestList?specialNo='
      uuu = 'http://123.127.88.167:8888/tradeClient/observe/specialList'
      dq = HTTP.get(uuu).to_s
      dqq = JSON.parse(dq)
      dqq[0].nil? ? dqqq = '' : dqqq = dqq[0]['specialNo']
      u = uu + dqqq
      d = HTTP.get(u).to_s
      dd = JSON.parse(d)
      ddd = dd['rows']
      [ddd, dqq]
    rescue
      retry
    end
  end

  loop do
    sleep 0.3
    n, x = a
    break if x.empty?
    next if n.nil?
    n.each do |d|
      if d['remainSeconds'].to_i < 2
        d['requestAlias'].nil? ? y = '13' : y = d['requestAlias'][11] + d['requestAlias'][12]
        t = '拍卖'
        g = Grain.new(market_name: 'guojia', mark_number: d['requestAlias'], year: y, variety: d['varietyName'], grade: d['gradeName'], trade_amount: d['num'], starting_price: d['basePrice'], latest_price: d['currentPrice'], address: d['requestBuyDepotName'], status: d['statusName'], trantype: t)
        g.save
      else
        next
      end
    end
  end
end
