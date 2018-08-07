# frozen_string_literal: true

task first: :environment do
  #require 'open-uri'
  url1 = 'http://220.248.203.59:8686/rtp/data/race/getAllRaceMarketing.jsp'
  url2 = 'http://220.248.203.59:8686/rtp/data/race/getRaceMeeting.jsp?id='
  url3 = 'http://220.248.203.59:8686/rtp/data/race/getRaceTacheDetail.jsp?id='
  #docs = Nokogiri::HTML(open(url1, read_timeout: 5), nil, 'utf-8').text
  docs = HTTP.get(url1).to_s
  return if docs == 'null'
  doc = JSON.parse(docs)
  #pp doc
  doc.each do |i|
    v1 = i[0]
    market_name = i[1]
    url21 = "#{url2}#{v1.to_i}"
    #docs21 = Nokogiri::HTML(open(url21, read_timeout: 5), nil, 'utf-8').text
    docs21 = HTTP.get(url21).to_s
    next if docs21 == 'null'
    doc21 = JSON.parse(docs21)
    v2 = doc21[0]
    x = doc21[3].to_i
    (1..x).each do |ii|
      url31 = url3 + v2 + '-' + ii.to_s
      #pp url31
      #docs31 = Nokogiri::HTML(open(url31, read_timeout: 5), nil, 'utf-8').text
      docs31 = HTTP.get(url31).to_s
      next if docs31 == 'null'
      doc31 = JSON.parse(docs31)
      #pp doc31
      doc31.each do |d|
        next if d[11] == 'A' || d[11] == 'B'
        d[7] = '流拍' if d[11] == 'G'
        d[13] = '采购' if d[13] == '竞卖'
        d[13] = '拍卖' if d[13] == '竞买'
        g = Grain.new(market_name: market_name, mark_number: d[1], year: d[2], variety: d[3], grade: d[4], trade_amount: d[5].delete(','), starting_price: d[6].delete(','), latest_price: d[7].delete(','), address: d[9], status: d[11], trantype: d[13])
        g.save
      end
    end
  end
end
