class ListsController < ApplicationController
  before_action :set_list, only: %i[show edit update destroy]
  def index
    @lists = List.all
  end

  def show
    # set_list
    @bookmark = Bookmark.new
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    @list.user = current_user
    if @list.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    # set list
    return unless @list.user == current_user
  end

  def update
    return unless @list.user == current_user

    @list = List.update(list_params)
    if @list.save
      redirect_to list_path(@list)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @list.destroy
    redirect_to lists_path, status: :see_others
  end

  private

  def set_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name)
  end
end
