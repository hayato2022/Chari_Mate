class Admin::PostsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_post, only: [:show, :destroy]

  def index
    @tag_list = Tag.all

    if params[:tag_id]
      @tag = Tag.find(params[:tag_id])
      @posts = @tag.posts.page(params[:page]).per(3)
      @post_name = @tag.name
    else
      @posts = Post.page(params[:page]).per(3)
      @post_name = "ユーザー"
    end
  end

  def show
    @post_tags = @post.tags
  end

  def destroy
    if @post.destroy
      redirect_to admin_user_path(@post.user.id), flash: {info: "投稿を削除しました"}
    else
      flash.now[:danger] = '削除に失敗しました'
      render admin_post_path(@post)
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end
end
