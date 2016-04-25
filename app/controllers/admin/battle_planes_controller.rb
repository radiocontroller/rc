  class Admin::BattlePlanesController < Admin::BaseController
    before_action :set_limit, only: [:index, :new]

    def index
      @battle_planes = BattlePlane.normal.order('sort_id asc')
    end

    def new
      @plane = BattlePlane.new
    end

    def create
      plane = BattlePlane.new(battle_plane_params)
      previous = BattlePlane.normal.find_by(battle_plane_params.except(:title, :content))
      if plane.save
        previous.try(:empty_order!)
        redirect_to admin_battle_planes_path, notice: '创建成功!'
      else
        redirect_to new_admin_battle_plane_path, alert: plane.errors.full_messages
      end
    end

    def update
      BattlePlane.normal.find_by(sort_id: params[:sort_id]).try(:empty_order!)
      BattlePlane.normal.find(params[:id]).set_order!(params[:sort_id])
      redirect_to admin_battle_planes_path, notice: '更新成功!'
    end

    private

      def battle_plane_params
        params.require(:battle_plane).permit(:title, :content, :sort_id)
      end

      def set_limit
        @limit = 3
      end

      def set_page_nav
        @page_nav = PageNavCollection.to_nav(
          [
            { name: '后台管理', url: '/admin' },
            { name: '战机模块', url: '/admin/battle_planes' },
            { name: Settings.action[request[:action]], url: request.path, end: true }
          ]
        )
      end

  end
