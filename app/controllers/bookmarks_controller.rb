class BookmarksController < ApplicationController
  def new
    @list = Bookmark.new(params[:list_id])
  end

  def create
    @bookmark = Bookmark.new(params[bookmark_params])
    if @bookmark.save
      redirects_to list_path(@list)
    else
      render :new
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:bookmark])
    @bookmark.destroy
  end
end
