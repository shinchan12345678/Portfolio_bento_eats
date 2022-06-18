class Admin::OwnersController < ApplicationController
  def index
    @owners = Owner.all.page(params[:page])
  end

  def destroy
    Owner.find(params[:id]).destroy
  end
end
