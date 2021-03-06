class PostsController < ApplicationController
  before_action :authenticate_user

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
  end

  def create
    Post.create(
      title: params[:title],
      content: params[:content],
      user_id: current_user.id
    )
    redirect_to '/'
  end

  def destroy
    # :id 를 통해 Post 찾는다.
    # 그걸 지워준다.
    post = Post.find(params[:id])
    post.destroy
    redirect_to '/'
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    # :id 를 통해 Post 찾는다.
    # 그걸 업데이트해준다.
    post = Post.find(params[:id])
    post.update(
      title: params[:title],
      content: params[:content]
    )
    redirect_to '/'
  end

  def add_comment
    Comment.create(
      content: params[:content],
      post_id: params[:id],
      user_id: current_user.id
    )

    redirect_to :back
  end
end
