class Public::OwnersController < ApplicationController
  def index
    @owners = Owner.all
  end

  def show
  end
end
