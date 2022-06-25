class Public::CommentsController < Public::ApplicationController
  def create
    @item = Item.find(params[:item_id])
    @comment = current_customer.review_comment(@item, comment_params[:text])
    if @comment.save
      redirect_to item_path(@item), notice: "コメントしました"
    else
      redirect_to item_path(@item), alert: "0字以上で入力してください"
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    @item = comment.item
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
