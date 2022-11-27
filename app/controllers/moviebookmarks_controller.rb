class MoviebookmarksController < ApplicationController
  before_action :set_moviebookmark

  def destroy
    return unless @moviebookmark.bookmark.list.user == current_user

    @list = @moviebookmark.bookmark.list
    @moviebookmark.destroy
    redirect_to list_path(@list), status: :see_other
  end

  private

  def set_moviebookmark
    @moviebookmark = Moviebookmark.find(params[:id])
  end
end
