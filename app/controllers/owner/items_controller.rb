class Owner::ItemsController < Owner::ApplicationController
  def show
    @items = Item.all
    @informations = Information.all
  end

  def new
    @item = Item.new
  end

  def create
    item = current_owner.items.new(item_params)
    if item.save
      redirect_to owner_items_path
    else
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    Item.find(params[:id]).update(item_params)
    owners
  end

  def destroy
    Item.find(params[:id]).destroy
    @items = current_owner.items
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :introduction, :image)
  end
end
