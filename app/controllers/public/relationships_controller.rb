class Public::RelationshipsController < Public::ApplicationController
  def create
    owner = Owner.find(params[:owner_id])
    current_customer.follow(owner)
    redirect_to owner_path(owner.id)
  end

  def destroy
    owner = Owner.find(params[:owner_id])
    current_customer.unfollow(owner)
    redirect_to owner_path
  end
end
