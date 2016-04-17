module Admin
  class BattlePlanesController < BaseController
    layout 'admin'
    before_action :set_limit, only: [:index, :new]

    def index
      @planes = BattlePlane.order('sort_id asc')
    end

    def new
      @plane = BattlePlane.new
    end

    def create
      plane = BattlePlane.new(battle_plane_params)
      previous = BattlePlane.find_by(battle_plane_params.except(:title, :content))
      if plane.save
        previous.try(:empty_order!)
        redirect_to admin_battle_planes_path
      else
        @plane = BattlePlane.new
        render :new
      end
    end

    def update
      @plane = BattlePlane.find(params[:id])
      BattlePlane.find_by(sort_id: params[:sort_id]).try(:empty_order!)
      @plane.update(sort_id: params[:sort_id])
      redirect_to admin_battle_planes_path
    end

    private

      def battle_plane_params
        params.require(:battle_plane).permit(:title, :content, :sort_id)
      end

      def set_limit
        @limit = 3
      end

  end
end
