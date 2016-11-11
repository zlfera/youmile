task :first do
  require 'open-uri'
  require 'json'
  v1 = ''
  v2 = ''
  url1 = 'http://220.248.203.59:8686/rtp/data/race/getAllRaceMarketing.jsp'
  url2 = "http://220.248.203.59:8686/rtp/data/race/getRaceMeeting.jsp?id="
  url3 = "http://220.248.203.59:8686/rtp/data/race/getRaceTacheDetail.jsp?id="
  docs = Nokogiri::HTML(open(url1), nil, 'utf-8')
  doc = JSON.parse(docs.css('p').text)
  doc.each do |i|
    i.each do |m|
      v1 = m
      url21 = url2 + v1.to_s
      docs21 = Nokogiri::HTML(open(url21), nil, 'utf-8')

    end
  end
  
end
