class ApplicationController < ActionController::Base
     
     
    include Pundit
#     after_action :verify_authorized, except: :index
#   after_action :verify_policy_scoped, only: :index
    protect_from_forgery with: :exception

    before_action :configure_permitted_parameters, if: :devise_controller?

    rescue_from Pundit::NotAuthorizedError  do
               flash[:notice] = "You are not authorized to perform this action."
               redirect_to(request.referrer || root_path)
          end
    
    protected

         def configure_permitted_parameters
              devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:first_name, :last_name, :email, :password, :role)}

              devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:first_name, :last_name,:email, :password, :role, :current_password)}
         end
    
end