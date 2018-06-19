# frozen_string_literal: true

task gg: :environment do
  require 'open-uri'
  def a
    begin
      uu = 'http://123.127.88.167:8888/tradeClient/observe/requestList?specialNo='
      uuu = 'http://123.127.88.167:8888/tradeClient/observe/specialList'
      dq = Nokogiri::HTML(open(uuu, read_timeout: 5), nil, 'utf-8')
      dqq = JSON.parse(dq.text)
      dqq[0].nil? ? dqqq = '' : dqqq = dqq[0]['specialNo']
      u = uu + dqqq
      d = Nokogiri::HTML(open(u, read_timeout: 5), nil, 'utf-8')
      dd = JSON.parse(d.text)
      ddd = dd['rows']
      [ddd, dqq]
    rescue
      retry
    end
  end

  loop do
    begin
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
    rescue
      retry
    end
  end
end
