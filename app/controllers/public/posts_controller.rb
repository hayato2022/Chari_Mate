class Public::PostsController < ApplicationController
  before_action :authenticate_user!
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    # splitメソッドとは文字列を分割して配列にするメソッド
    # 受け取った値を「,」で区切って配列にする
    tag_list = params[:post][:name].split(',')
    if @post.save
      @post.save_tag(tag_list)
      redirect_to post_path(@post.id), notice: '投稿完了しました'
    else
      render :new
    end
  end

  def index
     @tag_list = Tag.all

    if params[:tag_id]
      @tag = Tag.find(params[:tag_id])
      @posts = @tag.posts.all
      @post_name = @tag.name
    else
      @posts = Post.all
      @post_name = "みんな"
    end

  end

  def show
    @post = Post.find(params[:id])
    @post_tags = @post.tags
    @post_comment = PostComment.new
  end

  def search
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    tag_list = params[:post][:name].split(',')
    if @post.update(post_params)
      @post.save_tag(tag_list)
      redirect_to post_path(@post.id), notice: '編集完了しました'
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      redirect_to user_path(current_user.id), notice: '投稿を削除しました'
    else
      flash.now[:alert] = '削除に失敗しました'
      render post_path(@post)
    end
  end

  private

  def post_params
    params.require(:post).permit(:body, :image, :tag_id, :lat, :lng)
  end

end
