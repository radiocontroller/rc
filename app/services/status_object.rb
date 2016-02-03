module StatusObject
  class Status
    attr_reader :alert

    def initialize(options = {})
      @success = options[:success]
      @alert = options[:alert]
    end

    def success?
      @success
    end
  end
end
