class WelcomesController < BaseController
  layout 'welcome'

  def index
    @fighter_planes = FighterPlane.all
  end
end
