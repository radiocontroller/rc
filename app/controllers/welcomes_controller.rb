class WelcomesController < ApplicationController
  def index
    @fighter_planes = FighterPlane.all
  end
end
