class LinksController < ApplicationController
  def index
    @links = Link.all
  end

  def show
    @link = Link.find(params[:id])
  end

  def new
    @link = Link.new
  end

  def create
    @link = Link.create(params[:link])
    redirect_to link_path(@link)
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
