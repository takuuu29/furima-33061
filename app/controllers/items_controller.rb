class ItemsController < ApplicationController
  before_action :move_to_log_in, except: [:index, :show]

  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(items_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def move_to_log_in
    redirect_to new_user_session_path unless user_signed_in?
  end

  def items_params
    params.require(:item).permit(:name, :text, :category_id, :sales_id, :shipping_id, :prefecture_id, :scheduled_id, :price, :image).merge(user_id: current_user.id)
  end

end
