class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
    redirect_to '/'
  end

  private
  def item_params
    params.require(:item).permit(:image, :item_name, :item_info,
       :category_id, :sales_status_id, :shipping_fee_status_id, :prefecture_id,
       :scheduled_delivery_id, :item_price).merge(user_id: current_user.id)
  end
end
