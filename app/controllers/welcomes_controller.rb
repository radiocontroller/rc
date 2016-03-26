class WelcomesController < ApplicationController
  layout 'welcome'

  def index
    @fighter_planes = FighterPlane.all
  end
end
