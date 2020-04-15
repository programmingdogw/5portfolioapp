class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :basic_auth


  protected
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :age])
  end
  
  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == 'dog' && password == '7777'
    end
  end

end
