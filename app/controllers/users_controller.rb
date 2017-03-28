class UsersController < Clearance::UsersController
def edit
  current_user_authorised?(params[:id]), user_path(id: params[:id])
  @user = User.find_by_id(params[:id])
end

private
  def user_params
    params.require(:user).permit(:email, :password, :name)
  end
end
