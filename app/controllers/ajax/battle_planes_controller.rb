module Ajax
  class BattlePlanesController < BaseController

    def destroy
      @plane = BattlePlane.normal.find(params[:id])
      @plane.remove!
    end

  end
end
