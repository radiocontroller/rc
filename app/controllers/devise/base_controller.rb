class Devise::BaseController < ApplicationController
  protect_from_forgery with: :exception
end
