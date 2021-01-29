class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  def index
    @items = Item.all.order(id: 'DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :content, :category_id, :item_status_id, :delivery_fee_id, :shipping_area_id,
                                 :shipping_days_id, :price, :image).merge(user_id: current_user.id)
  end
end