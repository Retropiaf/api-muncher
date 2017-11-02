class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.logged_in?
    session[:user_id] ? true : false
  end

end
