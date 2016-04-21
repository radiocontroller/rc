class PageNav
  delegate :link_to, to: :helper

  def initialize(options = {})
    @end = options.fetch(:end, false)
    @name = options[:name]
    @url = options[:url]
  end

  def to_nav
    html = "<li>"
    html += "#{ link_to @name, @url }</li>"
    html += "<li><i class='fa fa-angle-right'></i></li>" if !end?
    html
  end

  private

    def end?
      @end
    end

    def helper
      ActionController::Base.helpers
    end
end
