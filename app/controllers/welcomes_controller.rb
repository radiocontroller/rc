class WelcomesController < ApplicationController
  def index
    @fighter_planes = Article.all
  end
end
