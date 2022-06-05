class Owner::ItemsController < Owner::ApplicationController
  def index
    @items = Item.all
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
