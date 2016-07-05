class AccessLogJob < ActiveJob::Base
  queue_as :default

  def perform(ip)
    url = "http://ip.taobao.com/service/getIpInfo.php?ip=#{ip}"
    json = RestClient.get(url)
    response = JSON.parse(json)
    data = response["data"]
    location = data["country"]
    location = data["area"] if data["area"].present?
    location = data["region"] if data["region"].present?
    location = data["city"] if data["city"].present?
    AccessLog.create(ip: ip, location: location)
  end
end
