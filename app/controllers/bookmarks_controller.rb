class BookmarksController < ApplicationController
  before_action :set_list, only: %i[new create]
  def new
    return unless @list.user == current_user

    @bookmark = Bookmark.new
    authorize @bookmark
  end

  def create
    return unless @list.user == current_user

    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    authorize @bookmark
    if @bookmark.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_list
    @list = List.find(params[:list_id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:comment, movie_ids: [])
  end
end
