class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:list])
  end

  def new
    @list = List.new(list_params)
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirects_to lists_path
    else
      render :new
    end
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end
end
