task :first => :environment do
  require 'open-uri'
  require 'json'
  url1 = 'http://220.248.203.59:8686/rtp/data/race/getAllRaceMarketing.jsp'
  url2 = "http://220.248.203.59:8686/rtp/data/race/getRaceMeeting.jsp?id="
  url3 = "http://220.248.203.59:8686/rtp/data/race/getRaceTacheDetail.jsp?id="
  docs = Nokogiri::HTML(open(url1), nil, 'utf-8')
  doc = JSON.parse(docs.text)
  doc.each do |i|
      v1 = i[0]
      market_name = i[1]
      url21 = "#{url2}#{v1.to_i}"
      docs21 = Nokogiri::HTML(open(url21), nil, 'utf-8')
      if docs21.text == 'null'
        break
      else
        doc21 = JSON.parse(docs21.text)
        v2 = doc21[0]
        ii = doc21[3]
        iii = ii.to_i
        (1..iii).each do |i|
          url31 = url3 + v2 + '-' + i.to_s
          docs31 = Nokogiri::HTML(open(url31), nil, 'utf-8')
          doc31 = JSON.parse(docs31.text) 
          doc31[0].delete_at(0)
          doc31[0].delete_at(7)
          doc31[0].delete_at(8)
          doc31[0].delete_at(9)
          doc31[0].delete_at(9)
          d = doc31[0]
          g = Grain.new(market_name: market_name, mark_number: d[0], year: d[1], variety: d[2], grade: d[3], trade_amount: d[4], starting_price: d[5], latest_price: d[6], address: d[7], status: d[8])
          g.save
        end
      end
  end
  
end
