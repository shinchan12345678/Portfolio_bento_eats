class Owner::InformationsController < ApplicationController
  def new
    gon.latitude = 35.4577205 # 岐阜の緯度
    gon.longitude = 136.793811 # 岐阜の経度
    @information = Information.new
  end

  def create
    information = current_owner.informations.new(information_params)
    # デフォルトで0(掲載中)がセットされ、掲載しない場合に１(掲載終了)を上書きセット
    information.is_valid = 1 if params[:information][:is_valid].to_i == "1"
    if information.save
      redirect_to owner_items_path
    end
  end

  private

  def information_params
    params.require(:information).permit(:open_date, :close_date, :latitude, :longitude)
  end
end
