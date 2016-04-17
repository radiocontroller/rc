module Ajax
  class BattlePlanesController < BaseController
    def update
      @plane = BattlePlane.find(params[:id])
      @plane.update(title: params[:title], content: params[:content])
    end
  end
end
