class VideosController < ApplicationController
  before_action :set_videos, :set_search, only: [:fixed_wing, :helicopter, :fpv, :glider]
  before_action :set_video, only: [:show]
  before_action :set_page_nav

  def index
    set_categories
  end

  def show
  end

  def fixed_wing
  end

  def helicopter
  end

  def fpv
  end

  def glider
  end

  private

    def set_categories
      @categories = Video::CATEGORIES.map do |english, chinese|
                  {
                    chinese: chinese,
                    english: english,
                    videos: Video.normal.send(english).sorted
                  }
               end
    end

    def set_videos
      q = Video.normal.send(action_name.to_sym).ransack(params[:q])
      @videos = q.result.order("id desc")
    end

    def set_video
      @video = Video.normal.find(params[:id])
    end

    def set_search
      @search = {}
      @search[:title] = params[:q] && params[:q][:title_cont]
    end

    def set_page_nav
      @page_nav = PageNavCollection.to_nav(
        [
          { name: '首页', url: '/' },
          { name: '视频', url: '/videos' },
          { name: @video.try(:title) || Settings.action[action_name], end: true }
        ]
      )
    end

end
