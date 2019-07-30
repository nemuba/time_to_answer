class ApplicationController < ActionController::Base
  
  layout :layout_by_devise
  
  private

  def layout_by_devise
    if devise_controller? && resource_class == Admin
      "admin_devise"
    else
      "application"
    end
  end
  
end
