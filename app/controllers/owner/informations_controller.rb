class Owner::InformationsController < ApplicationController
  def new
    @information = Information.new
  end

  def create
    binding.pry
    information = current_owner.informations.new(information_params)
    information.is_valid = 1 if params[:information][:is_valid] == "1" #修正ポイント
    if information.save
      redirect_to owner_items_path
    end
  end

  private

  def information_params
    params.require(:information).permit(:open_date, :close_date)
  end

end
