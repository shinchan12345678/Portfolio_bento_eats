class Owner::ItemsController < Owner::ApplicationController
  def show
    @item = Item.find(params[:id])
    @comments = @item.comments.page params[:page]
    respond_to do |format|
      format.html
      format.js
    end
  end

  def new
    @item = Item.new
  end

  def create
    @item = current_owner.items.new(item_params)
    if @item.save
      redirect_to owner_item_path(@item), notice: "商品を登録しました"
    else
      render :new
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to owner_item_path(@item)
    else
      render :edit
    end
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
