class MoviebookmarksController < ApplicationController
  def destroy
    @moviebookmark = Moviebookmark.find(params[:id])
    @list = @moviebookmark.bookmark.list
    @moviebookmark.destroy
    redirect_to list_path(@list), status: :see_other
  end
end
