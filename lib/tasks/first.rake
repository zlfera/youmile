task :first do
  require 'open-uri'
  require 'json'
  v1 = ''
  v2 = ''
  url1 = 'http://220.248.203.59:8686/rtp/data/race/getAllRaceMarketing.jsp'
  url2 = "http://220.248.203.59:8686/rtp/data/race/getRaceMeeting.jsp?id="
  url3 = "http://220.248.203.59:8686/rtp/data/race/getRaceTacheDetail.jsp?id="
  docs = Nokogiri::HTML(open(url1), nil, 'utf-8')
  doc = JSON.parse(docs.text)
  doc.each do |i|
    i.each do |i|
      v1 = i
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
          url31 = "#{url3}#{v2}-#{i}"
          docs31 = Nokogiri::HTML(open(url31), nil, 'utf-8')
          doc31 = JSON.parse(docs31.text)
          puts doc31
        end
      end
    end
  end
  
end
