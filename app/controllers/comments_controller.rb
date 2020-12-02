class CommentsController < ApplicationController
  def create
    # comment の新しいインスタンスを作成
    @comment = Comment.new(comment_params)

    # comment の save 後の処理
    if @comment.save
      redirect_to prototype_path(@comment.prototype)
    else
      @prototype = @comment.prototype
      @comments = @prototype.comments
      render 'prototypes/show'
    end
  end

  private

  # params で送られてきた値のチェック
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, prototype_id: params[:prototype_id])
  end
end
