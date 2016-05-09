  class Admin::BattlePlanesController < Admin::BaseController
    before_action :set_limit, only: [:new, :edit]
    before_action :set_battle_plane, only: [:edit, :update]

    def index
      @battle_planes = BattlePlane.normal.order('sort_id asc')
    end

    def new
      @battle_plane = BattlePlane.new
    end

    def edit
    end

    def create
      plane = BattlePlane.new(battle_plane_params)
      if plane.save
        free_order!(plane)
        redirect_to admin_battle_planes_path, notice: '创建成功!'
      else
        redirect_to new_admin_battle_plane_path, alert: plane.errors.full_messages
      end
    end

    def update
      if @battle_plane.update(battle_plane_params)
        free_order!(@battle_plane)
        redirect_to admin_battle_planes_path, notice: '更新成功!'
      else
        redirect_to edit_admin_battle_plane_path(@battle_plane), alert: @battle_plane.errors.full_messages
      end
    end

    private

      def battle_plane_params
        params.require(:battle_plane).permit(:title, :content, :sort_id)
      end

      def set_battle_plane
        @battle_plane = BattlePlane.normal.find(params[:id])
      end

      def set_limit
        @limit = 3
      end

      def set_page_nav
        @page_nav = PageNavCollection.to_nav(
          [
            { name: '后台管理', url: '/admin' },
            { name: '战机模块', url: '/admin/battle_planes' },
            { name: Settings.action[request[:action]], end: true }
          ]
        )
      end

      def free_order!(plane)
        BattlePlane.normal.where(sort_id: plane.sort_id).where.not(id: plane.id).map(&:empty_order!)
      end
  end
