require_dependency '../../lib/edamam_api_wrapper'
require_dependency '../../lib/recette'

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
end
