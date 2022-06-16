class Owner::OwnersController < Owner::ApplicationController
  def show
    @items = current_owner.items
    @informations = current_owner.informations.page params[:page]
    respond_to do |format|
      format.html
      format.js
    end
  end
end
