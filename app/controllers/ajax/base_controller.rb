module Ajax
  class BaseController < ActionController::Base
    respond_to :js
  end
end
