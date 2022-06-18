class Public::FavoritesController < Public::ApplicationController
  def create
    @item = Item.find(params[:item_id])
    current_customer.mark_favorite(@item)
  end

  def destroy
    @item = Item.find(params[:item_id])
    current_customer.remove_favorite(@item)
  end
end
