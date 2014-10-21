class LikesController < ApplicationController
  def create
    @bookmark = Bookmark.find(params[:bookmark_id])
    like = current_user.likes.build(bookmark: @bookmark)

    if like.save
      flash[:notice] = "Bookmark was liked."
      redirect_to bookmarks_path
    else
      flash[:error] = "Bookmark was not liked. Please try again."
      redirect_to root_path
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:bookmark_id])
    like = current_user.likes.find(params[:id])

    if like.destroy
      flash[:notice] = "Like was removed."
      redirect_to bookmarks_path
    else
      flash[:error] = "Like was not removed. Please try again."
      redirect_to bookmarks_path
    end
  end
end
