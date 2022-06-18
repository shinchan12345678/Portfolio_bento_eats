class Public::RelationshipsController < Public::ApplicationController
  def create
    @owner = Owner.find(params[:owner_id])
    current_customer.follow(@owner)
  end

  def destroy
    @owner = Owner.find(params[:owner_id])
    current_customer.unfollow(@owner)
  end
end
