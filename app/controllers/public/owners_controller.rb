class Public::OwnersController < Public::ApplicationController
  def index
    @q = Owner.all.ransack(params[:q])
    @owners = @q.result.page params[:page]
    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
    @owner = Owner.find(params[:id])
    @items = @owner.items
  end

  def owner_informations
    @owner = Owner.find(params[:id])
    # 当日時点で有効な投稿のみ表示
    @informations = Information.where(owner_id: @owner.id).close_date_check.info_invalid
  end
end
