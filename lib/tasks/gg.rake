# frozen_string_literal: true

task gg: :environment do
  require 'open-uri'
  def a(dqqq)
    begin
      uu = 'http://123.127.88.167:8888/tradeClient/observe/requestList?specialNo='
      u = uu + dqqq
      d = Nokogiri::HTML(open(u, read_timeout: 5), nil, 'utf-8')
      dd = JSON.parse(d.text)
      dd['rows']
    rescue
      retry
    end
  end

  qw = {}
  loop do
    uuu = 'http://123.127.88.167:8888/tradeClient/observe/specialList'
    dq = Nokogiri::HTML(open(uuu, read_timeout: 5), nil, 'utf-8')
    dqq = JSON.parse(dq.text)
    break if dqq.empty?
    dqq.each do |i|
      if !qw.has_key?(i['specialNo'])
        ii = Thread.new {
          loop do
            n = a(i['specialNo'])
            break if n.nil?
            n.each do |d|
              if d['remainSeconds'].to_i < 2
                if d['requestAlias'].nil? || d['requestAlias'].size <= 12
                  y = '00'
                else
                  y = d['requestAlias'][11] + d['requestAlias'][12]
                end
                t= '拍卖'
                g = Grain.new(market_name: 'guojia', mark_number: d['requestAlias'], year: y, variety: d['varietyName'], grade: d['gradeName'], trade_amount: d['num'], starting_price: d['basePrice'], latest_price: d['currentPrice'], address: d['requestBuyDepotName'], status: d['statusName'], trantype: t)
                g.save
              else
                next
              end
            end
          end
        }
        qw.store(i['specialNo'], ii)
        p qw 
        p qw[i['specialNo']]
      else
        if !qw[i['specialNo']].status
          p qw[i['specialNo']]
          qw.delete(i['specialNo'])
          p qw
        else
          next
        end
      end
    end
  end
end
#
#  loop do
#    begin
#      uuu = 'http://123.127.88.167:8888/tradeClient/observe/specialList'
#      dq = Nokogiri::HTML(open(uuu, read_timeout: 5), nil, 'utf-8')
#      dqq = JSON.parse(dq.text)
#      break if dqq.empty?
#      dqq.each do |i|
#        Thread.new {
#          n = a(i['specialNo'])
#          next if n.nil?
#          n.each do |d|
#            if d['remainSeconds'].to_i < 2
#              if d['requestAlias'].length < 15 or d['requestAlias'].nil?
#                y = '00'
#              else
#                y = d['requestAlias'][11] + d['requestAlias'][12]
#              end
#              t= '拍卖'
#              g = Grain.new(market_name: 'guojia', mark_number: d['requestAlias'], year: y, variety: d['varietyName'], grade: d['gradeName'], trade_amount: d['num'], starting_price: d['basePrice'], latest_price: d['currentPrice'], address: d['requestBuyDepotName'], status: d['statusName'], trantype: t)
#              g.save
#            else
#              next
#            end
#          end
#        }
#      end
#    rescue
#      retry
#    end
#  end
#end
