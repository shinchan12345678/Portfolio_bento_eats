class Admin::OwnersController < ApplicationController
  def index
    @owners = Owner.all.page(params[:page])
  end

  def destroy
    Owner.find(params[:id]).destroy
    redirect_to admin_owners_path, notice: 'オーナーを削除しました'
  end
end
