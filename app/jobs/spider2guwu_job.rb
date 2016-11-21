class Spider2guwuJob < ActiveJob::Base
  queue_as :default
  def perform()
    require 'open-uri'
    require 'json'
    url1 = 'http://220.248.203.59:8686/rtp/data/race/getAllRaceMarketing.jsp'
    url2 = 'http://220.248.203.59:8686/rtp/data/race/getRaceMeeting.jsp?id='
    url3 = 'http://220.248.203.59:8686/rtp/data/race/getRaceTacheDetail.jsp?id='
    docs = Nokogiri::HTML(open(url1, read_timeout: 5), nil, 'utf-8')
    if docs.text == 'null'
      puts '对不起，今天没有交易'
    else
      doc = JSON.parse(docs.text)
      doc.each do |i|
        v1 = i[0]
        market_name = i[1]
        url21 = "#{url2}#{v1.to_i}"
        docs21 = Nokogiri::HTML(open(url21, read_timeout: 5), nil, 'utf-8')
        if docs21.text == 'null'
          break
        else
          doc21 = JSON.parse(docs21.text)
          v2 = doc21[0]
          (1..12).each do |i|
            url31 = url3 + v2 + '-' + i.to_s
            docs31 = Nokogiri::HTML(open(url31, read_timeout: 5), nil, 'utf-8')
            if docs31.text == 'null'
              next
            else
              doc31 = JSON.parse(docs31.text)
              d = doc31[0]
              if d[11] == 'A' || d[11] == 'B'
                next
              elsif d[11] == 'G' || d[11] == 'F'
                d[7] = '流拍' if d[11] == 'G'
                d[13] = '采购' if d[13] == '竞卖'
                d[13] = '拍卖' if d[13] == '竞买'
                g = Grain.new(market_name: market_name, mark_number: d[1], year: d[2], variety: d[3], grade: d[4], trade_amount: d[5], starting_price: d[6], latest_price: d[7], address: d[9], status: d[11], trantype: d[13])
                g.save
              end
            end
          end
        end
      end
    end
  end
end
