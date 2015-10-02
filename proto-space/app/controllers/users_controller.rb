class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update]

  def show
    @prototypes = @user.prototypes
  end

  def edit
  end

  def update
    if current_user.update(udpate_params)
      redirect_to user_path(@user), success: "sccessfully updated your profile."
    else
      redirect_to edit_user_path(@user), warning: "unfortunately failed."
    end
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def udpate_params
    params.require(:user).permit(:email, :name, :profile, :member, :works, :avatar)
  end
end
