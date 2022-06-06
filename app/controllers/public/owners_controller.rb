class Public::OwnersController < Public::ApplicationController
  def index
    @owners = Owner.all
  end

  def show
    @owner = Owner.find(params[:id])
    @items = @owner.items
  end
end
