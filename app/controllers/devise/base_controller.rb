class Devise::BaseController < ApplicationController
  layout 'accounts'

  protect_from_forgery with: :exception
end
