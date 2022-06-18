class Public::CommentsController < Public::ApplicationController
  def create
    @item = Item.find(params[:item_id])
    current_customer.review_comment(@item, comment_params[:text])
    @comments = @item.comments.page params[:page]
    respond_to do |format|
      format.html
      format.js
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    current_customer.remove_comment(comment)
    @comments = @item.comments.page params[:page]
    respond_to do |format|
      format.html
      format.js
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
