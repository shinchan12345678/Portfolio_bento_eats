class Public::ItemsController < Public::ApplicationController
  def show
    @item = Item.find(params[:id])
    @comments = @item.comments 
  end
end
