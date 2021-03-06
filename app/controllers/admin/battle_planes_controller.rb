  class Admin::BattlePlanesController < Admin::BaseController
    before_action :set_limit, except: [:index]
    before_action :set_battle_plane, only: [:edit, :update]

    def index
      @battle_planes = BattlePlane.normal.order('sort_id asc').page(params[:page] || 1).per_page(page_num)
    end

    def new
      @battle_plane = BattlePlane.new
    end

    def edit
    end

    def create
      @battle_plane = BattlePlane.new(battle_plane_params)
      if @battle_plane.save
        redirect_to admin_battle_planes_path, notice: '创建成功!'
      else
        render :new
      end
    end

    def update
      if @battle_plane.update(battle_plane_params)
        redirect_to admin_battle_planes_path, notice: '更新成功!'
      else
        render :edit
      end
    end

    private

      def battle_plane_params
        params.require(:battle_plane).permit(:title, :content, :sort_id)
      end

      def set_battle_plane
        @battle_plane = BattlePlane.normal.find(params[:id])
      end

      def page_num
        6
      end

      def set_limit
        @limit = 3
      end

      def set_page_nav
        @page_nav = PageNavCollection.to_nav(
          [
            { name: '后台管理', url: '/admin' },
            { name: '战机模块', url: '/admin/battle_planes' },
            { name: Settings.action[action_name], end: true }
          ]
        )
      end
  end
