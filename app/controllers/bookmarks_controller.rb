class BookmarksController < ApplicationController

  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list_id = @bookmark
    if @bookmark.save
    redirect_to bookmark_path(@article)
    else
    render :new
    end
  end

  def destroy
    @bookmark = Bookmark.find(bookmark_params)
    @bookmark.destroy
    redirect_to bookmark_path
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id, :list_id)
  end

end
