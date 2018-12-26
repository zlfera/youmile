# frozen_string_literal: true
task gg: :environment do
  require 'open-uri'
  begin
  def a(dqqq)
    begin
      uu = 'http://123.127.88.167:8888/tradeClient/observe/requestList?specialNo='
      u = uu + dqqq
      d = Nokogiri::HTML(open(u, read_timeout: 2), nil, 'utf-8')
      #d = HTTP.get(u).to_s
      dd = JSON.parse(d.text)
    rescue
      retry
    end
    [dd['status'], dd['rows']]
  end
  qw = {}
  begin
  loop do
    uuu = 'http://123.127.88.167:8888/tradeClient/observe/specialList'
    #dq = HTTP.get(uuu).to_s
    dq = Nokogiri::HTML(open(uuu, read_timeout: 2), nil, 'utf-8')
    dqq = JSON.parse(dq.text)
    break if dqq.empty?
    dqq.each do |i|
      _, n = a(i['specialNo'])
      #next unless i['specialName'].include?('稻谷') || i['specialName'].include?('粮油') || i['specialName'].include?('粮')
      next if n[0]['varietyName'].include?('玉米') || n[0]['varietyName'].include?('豆') || n[0]['varietyName'].include?('麦') || n[0]['varietyName'].include?('油') || n[0]['varietyName'].include?('粳稻')
      if qw.has_key?(i['specialNo'])
        if qw[i['specialNo']].alive?
          next
        else
          qw.delete(i['specialNo'])
        end
      else
        ii = Thread.new(i) do |i|
          loop do
            m, n = a(i['specialNo'])
            break if m == 'no' || m == 'end'
            if m == 'yes'
              next if n[0]['varietyName'].include?('玉米') || n[0]['varietyName'].include?('豆') || n[0]['varietyName'].include?('麦') || n[0]['varietyName'].include?('油') || n[0]['varietyName'].include?('粳稻')
              n.each do |d|
                x = d['requestAlias']
                if d['remainSeconds'].to_i <= 3
                  if x.size <= 12 || x.size == 13
                    y = x.to_i
                    if y == 0
                      y = '00'
                    else
                      y = y.to_s
                      y = y[-2] + y[-1]
                    end
                  else
                    y = x[11] + x[12]
                    #a = Time.now.year.to_s
                    #a = a[2] + a[3]
                    #a = a.to_i
                    #if y.to_i > a
                    # y = '00'
                    #else
                    #  y
                    #end
                  end
                  t= '拍卖'
                    g = Grain.new(market_name: 'guojia', mark_number: d['requestAlias'], year: y, variety: d['varietyName'], grade: d['gradeName'], trade_amount: d['num'], starting_price: d['basePrice'], latest_price: d['currentPrice'], address: d['requestBuyDepotName'], status: d['statusName'], trantype: t)
                    g.save
                else
                  next
                end
              end
            else
              next
            end
          end
        end
        qw.store(i['specialNo'], ii)
      end
    end
  end
  rescue
    retry
  end
  rescue
    retry
  end
end
