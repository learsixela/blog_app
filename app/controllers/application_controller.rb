class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  protected
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :age, :phone])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :age, :phone])
  end
  def after_sign_in_path_for(resource)
    posts_path
  end

  # Solo los autores y administradores pueden crear un post.
  def authorize_request(kind = nil)
    unless kind.include?(current_user.role)
    redirect_to posts_path, notice: "You are not authorized to perform this action"
    end
  end
end
