require 'rubygem'
require 'nokogiri'
require 'open-uri'

url = "http://www.amazon.com/dp/B00X9CEVII/ref=s9_acsd_bw_wf_a_htluniv_cdl_6?pf_rd_m=ATVPDKIKX0DER&pf_rd_s=merchandised-search-6&pf_rd_r=1E0WEM7JA8H9YVD4EFQG&pf_rd_t=101&pf_rd_p=2246874842&pf_rd_i=10028275011"
doc = Nokogiri::HTML(open(url))
puts doc.at_css("title").text