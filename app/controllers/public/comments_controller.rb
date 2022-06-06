class Public::CommentsController < Public::ApplicationController
  def create
    item = Item.find(params[:item_id])
    current_customer.review_comment(item, comment_params[:text])
    redirect_to item_path(item)
  end

  def destroy
    comment = Comment.find(params[:id])
    item = comment.item
    current_customer.remove_comment(comment)
    redirect_to item_path(item)
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
