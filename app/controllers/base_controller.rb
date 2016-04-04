class BaseController < ApplicationController
  protect_from_forgery with: :exception
  respond_to :js
end
