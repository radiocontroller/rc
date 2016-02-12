class Devise::BaseController < ApplicationController
  layout 'account'

  protect_from_forgery with: :exception
end
