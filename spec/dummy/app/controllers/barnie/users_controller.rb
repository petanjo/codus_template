class Barnie::UsersController < Barnie::BaseController
  inherit_resources
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def build_resource_params
    [params.fetch(:user, {}).permit(:name, :email, :role)]
  end
end
