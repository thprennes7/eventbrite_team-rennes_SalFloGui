class UsersController < ApplicationController
  include UsersHelper
  before_action :authenticate_user!, only: [:show]

  def show
    @user = User.find(params[:id])
    @events = @user.events

    redirect_to user_path(current_user.id) unless is_current_user?(@user)
  end

  def destroy
  end
end
