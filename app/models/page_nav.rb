class PageNav
  delegate :link_to, to: :helper

  def initialize(options = {})
    @end = options.fetch(:end, false)
    @name = options[:name]
    @url = options[:url]
  end

  def to_nav
    if end?
      "<li class='active'>#{@name}</li>"
    else
      "<li>#{ link_to @name, @url }</li><i>/</i>"
    end
  end

  private

    def end?
      @end
    end

    def helper
      ActionController::Base.helpers
    end
end
