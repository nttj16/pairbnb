!1class UsersController < Clearance::UsersController
before_action :find_user, only: [:show, :edit, :update]
  def index
  end


  def edit
  end

  def update
    if @user.update(listing_params)
        flash[:success] = "Sucessfully updated user"
        redirect_to @user
    else
        flash[:danger] = "Error updating user"
        render :edit
    end
  end

  def show
  end

  def find_user
      @user = User.find(params[:id])
  end


private
  def user_params
    params.require(:user).permit(:email, :password, :name)
  end
end
