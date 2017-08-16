# frozen_string_literal: true

task second: :environment do
  require 'open-uri'
  require 'json'
  url1 = 'http://123.127.88.167:8888/tradeClient/observe/specialList'
  url2 = 'http://123.127.88.167:8888/tradeClient/observe/requestList?specialList=1418'
  url3 = 'http://123.127.88.167:8888/tradeClient/observe/statistic'
  loop do
    doc1 = Nokogiri::HTML(open(url1, read_timeout: 2), nil, 'utf-8')
    doc2 = Nokogiri::HTML(open(url2, read_timeout: 2), nil, 'utf-8')
    doc3 = Nokogiri::HTML(open(url3, read_timeout: 2), nil, 'utf-8')
    url1_json = JSON.parse(doc1.text)
    url2_json = JSON.parse(doc2.text)
    url3_json = JSON.parse(doc3.text)
    data_array = []
    if url2_json['status'] == 'yes'
      url2_json['rows'].each do |r|
        if r['remainseconds'] == '0' && !data_array.include?(r)
          data_array.push(r)
        end
      end
    end
    binding.pry
    break if url1_json.empty?
  end
end
