module Admin
  class BattlePlanesController < BaseController
    layout 'admin'

    def index
      @planes = BattlePlane.all
    end
  end
end
