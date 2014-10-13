class BookmarksController < ApplicationController
  def index
    @bookmarks = Bookmark.all
    @my_bookmarks = current_user.bookmarks
    authorize @bookmarks
    authorize @my_bookmarks
  end

  def show
    @bookmark = Bookmark.find(params[:id])
    @like = @bookmark.likes.find(params[:like_id])
    authorize @bookmark
  end

  def new
    @bookmark = Bookmark.new
    authorize @bookmark
  end

  def edit
    @bookmark = Bookmark.find(params[:id])

  end

  def create
    @bookmark = current_user.bookmarks.new(bookmark_params)
    @bookmark.user_id = current_user.id

    authorize @bookmark
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

    authorize @bookmark
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

    authorize @bookmark
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
