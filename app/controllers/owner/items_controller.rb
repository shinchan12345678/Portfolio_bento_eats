class Owner::ItemsController < Owner::ApplicationController
  def index
    @items = Item.all
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
  end

  def update
  end

  def destroy
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :introduction, :image)
  end
end
