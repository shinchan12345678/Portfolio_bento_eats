class Owner::InformationsController < Owner::ApplicationController
  def new
    gon.latitude = 35.4577205 # 岐阜の緯度
    gon.longitude = 136.793811 # 岐阜の経度
    @information = Information.new
  end

  def create
    @information = current_owner.informations.new(information_params)
    if @information.save
      redirect_to owner_owners_path, notice: "情報を投稿しました"
    else
      gon.latitude = 35.4577205 # 岐阜の緯度
      gon.longitude = 136.793811 # 岐阜の経度
      render :new
    end
  end

  def edit
    @information = Information.find(params[:id])
  end

  def update
    @information = Information.find(params[:id])
    if @information.update(information_params)
      redirect_to owner_owners_path, notice: "情報を更新しました"
    else
      render :edit
    end
  end

  def destroy
    Information.find(params[:id]).destroy
    redirect_to owner_owners_path, notice: "情報を削除しました"
  end

  private

  def information_params
    # 文字列として受け取ったデータを数値化
    params[:information][:is_valid] = params[:information][:is_valid].to_i
    params.require(:information).permit(:open_date, :close_date, :latitude, :longitude, :is_valid, :comment)
  end
end
