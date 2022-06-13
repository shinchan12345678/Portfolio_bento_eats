class Public::OwnersController < Public::ApplicationController
  def index
    @q = Owner.all.ransack(params[:q])
    @owners = @q.result
  end

  def show
    @owner = Owner.find(params[:id])
    @items = @owner.items
  end

  def owner_informations
    @owner = Owner.find(params[:id])
    @informations = Information.where(owner_id: @owner.id)
  end
end
