class PostsController < ApplicationController
  POSTS_PER_PAGE = 2

  def index
    @page = params.fetch(:page, 0).to_i
    @page = 0 if @page.negative? || @page > (Post.count / POSTS_PER_PAGE)

    @user = User.find(params[:user_id])
    @posts = Post.where(user: params[:user_id])
    @all_posts = @user.posts
  end

  def show
    @post = Post.find(params[:id])
    @user = User.find(params[:user_id])
    @comments = Comment.where(post_id: params[:id])
  end

  def new
    @post = Post.new
    render :new
  end

  def create
    @post = Post.new(params.require(:post).permit(:title, :body))
    @post.user = current_user

    if @post.save
      flash[:success] = 'New Post saved successfully!'
      redirect_to user_posts_path(current_user)
    else
      flash.now[:error] = 'Post failed..'
      render :new
    end
  end
end
