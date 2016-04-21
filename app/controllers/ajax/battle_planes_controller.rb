module Ajax
  class BattlePlanesController < BaseController
    before_action :set_plane

    def update
      @plane.update(title: params[:title], content: params[:content])
    end

    def destroy
      @plane.remove!
    end

    private

      def set_plane
        @plane = BattlePlane.find(params[:id])
      end
  end
end
