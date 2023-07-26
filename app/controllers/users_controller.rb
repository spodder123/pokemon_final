class UsersController < ApplicationController
  before_action :user_authentication!

  def user_authentication!
    if !user_signed_in?
      #not signed it
      redirect_to new_user_session_path
      return
    else
      # they are signed in
      if User.find(params[:id].to_i) != current_user
         redirect_to new_user_session_path
        return
      end
    end
  end




  def show
    @user = User.find(current_user.id)
  end

  def edit
    @user = User.find(params[:id])
    @p = Province.all
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to user_show_path, notice: "Profile successfully updated."
    else
      @p = Province.all
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :address, :postal_code, :province_id)
  end
end
