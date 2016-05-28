class AccessLogJob < ActiveJob::Base
  queue_as :default

  def perform(ip)
    AccessLog.create(ip: ip, location: Location.search(ip))
  end
end
