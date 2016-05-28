class Location
  def self.search(ip)
    place = nil
    Mechanize.new.get('http://www.baidu.com/') do |page|
      result = page.form_with(:name => 'f') do |search|
        search.wd = ip
      end.submit
      ip_tips = result.search("div.op-ip-detail").search("td span").text.strip
      place = result.search("div.op-ip-detail").search("td").text.strip
      place.slice! ip_tips
    end
    place
  end
end
