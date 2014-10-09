class BookmarksController < ApplicationController
  def index
    @bookmarks = Bookmark.all
  end

  def show
    @bookmark = Bookmark.find(params[:id])
  end

  def new
    @bookmark = Bookmark.new
  end

  def edit
    @bookmark = Bookmark.find(params[:id])
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)

    if @bookmark.save
      flash[:notice] = "Bookmark was saved."
      redirect_to bookmarks_path
    else 
      flash[:error] = "Bookmark was not saved. Please try again."
      render :new
    end
  end

  def update
    @bookmark = Bookmark.find(params[:id])

    if @bookmark.update_attributes(bookmark_params)
      flash[:notice] = "Bookmark was updated."
      redirect_to @bookmark
    else
      flash[:error] = "Bookmark was not updated. Please try again."
      render :edit
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])

    if @bookmark.destroy
      flash[:notice] = "Bookmark was deleted."
      redirect_to bookmarks_path
    else
      flash[:error] = "Bookmark was not deleted. Please try again."
      render :edit
    end
  end
  

  private

  def bookmark_params
    params.require(:bookmark).permit(:url, :title)
  end
end
