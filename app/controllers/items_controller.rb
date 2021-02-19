class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :user_signed_in, only: [:edit, :update]

  def index
    @items = Item.all.includes(:user).order('created_at DESC')
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

  def show
  end

  def edit
    if @item.user_id != current_user.id || @item.purchase.present?
      redirect_to action: :index
    end
  end

  def update
    if @item.update(items_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    if @item.user_id != current_user.id
      if @item.destroy
        redirect_to root_path
      else
        render :show
      end
    else
      redirect_to root_path
    end
  end

  private

  def items_params
    params.require(:item).permit(:name, :text, :category_id, :sales_id, :shipping_id, :prefecture_id, :scheduled_id, :price, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def user_signed_in
    unless current_user.id == @item.user_id || @item.purchase.present?
      redirect_to root_path
    end
  end

end
