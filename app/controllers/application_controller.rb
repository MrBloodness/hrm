class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!, except: [:home, :about, :contact]
  before_action :initialize_resource, only: [:new, :create]

  helper_method :resource_klass, :resource, :resources

  # def home
  # end

  # def about
  # end

  # def contact
  # end

  # def secret
  # end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name])
  end

  private

  def resource_klass
    controller_path.classify.constantize
  end

  def resource
    instance_variable_get("@#{resource_klass.model_name.param_key}")
  end

  def resource=(record)
    instance_variable_set("@#{resource_klass.model_name.param_key}", record)
  end

  def resources
    instance_variable_get("@#{resource_klass.model_name.plural}")
  end

  def resources=(record)
    instance_variable_set("@#{resource_klass.model_name.plural}", record)
  end

  def initialize_resource
    self.resource = resource_klass.new
  end

  def set_resource
    self.resource = resource_klass.find(params[:id])
  end

  def set_resources
    self.resources = resource_klass.all
  end
end
