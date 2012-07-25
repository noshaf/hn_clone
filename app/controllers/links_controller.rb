class LinksController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]
  
  def index
    if params[:user_id]
      @links = Link.where(:user_id => params[:user_id])
    else
      @links = Link.all
    end
  end

  def show
    @link = Link.find(params[:id])
  end

  def new
    @link = Link.new
  end

  def create
    @link = Link.new params[:link].merge user_id: current_user.id 
    if @link.save
      redirect_to link_path(@link)
    else
      render 'new'
    end
  end

  def edit
    @link = Link.find_by_id(params[:id])
  end

  def update
    @link = Link.find_by_id(params[:id])
    @link.update_attributes(params[:link])
    redirect_to link_path(@link)
  end

  def destroy
  end
end
