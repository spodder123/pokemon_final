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


  #   redirect_to new_user_session_path unless user_signed_in? && (User.find(params[:id].to_i) == current_user)
  # end
  #   if user_signed_in?
  #     userid = current_user.id
  #     if User.find(userid).nil?
  #       redirect to new_user_session_path
  #       return
  #     end
  #   else
  #     redirect to new_user_session_path
  #   end
  # end

  def show
    @user = User.find(current_user.id)
  end

  def edit
  end
end
