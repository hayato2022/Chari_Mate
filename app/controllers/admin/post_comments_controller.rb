class Admin::PostCommentsController < ApplicationController
  before_action :authenticate_admin!

  def destroy
    @post = Post.find(params[:post_id])
    @post_comment = PostComment.find(params[:id])
    if @post_comment.destroy
      redirect_to post_path(@post), notice: 'コメントを削除しました'
    else
      flash.now[:alert] = 'コメント削除に失敗しました'
      render post_path(@post)
    end
  end
end
