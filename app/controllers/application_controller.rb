class ApplicationController < ActionController::Base
  include LikesHelper
  protect_from_forgery
end
