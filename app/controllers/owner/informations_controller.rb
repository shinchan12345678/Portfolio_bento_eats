class Owner::InformationsController < ApplicationController
  def new
    @information = Information.new
    default_sw_t = [35.443736713821224, 136.76085201562503]
    default_ne_t = [35.47170185598229, 136.82676998437503]
    latitude_s, longitude_s = default_sw_t.map { |i| i }
    latitude_e, longitude_e = default_ne_t.map { |i| i }
    @informations = Information.map_view_ports(latitude_s, latitude_e, longitude_s, longitude_e)
    gon.informations = @informations
    # binding.pry
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
