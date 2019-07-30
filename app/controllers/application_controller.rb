class ApplicationController < ActionController::Base
  
  layout :layout_by_devise
  
  private

  def layout_by_devise
    devise_controller? ? "#{resource_class.to_s.downcase}_devise" : "application"          
  end
  
end
