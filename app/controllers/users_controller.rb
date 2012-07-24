class UsersController < ApplicationController

  def show
     @user = User.find_by_id(params[:id]) || current_user
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
