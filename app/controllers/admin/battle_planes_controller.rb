module Admin
  class BattlePlanesController < BaseController
    layout 'admin'

    def index
      @planes = BattlePlane.order('sort_id asc')
      @limit = 3
    end

    def sort
      @plane = BattlePlane.find(params[:id])
      previous = BattlePlane.find_by(sort_id: params[:sort_id])
      previous.update(sort_id: nil) if previous.present?
      @plane.update(sort_id: params[:sort_id])
      redirect_to admin_battle_planes_path
    end
  end
end
