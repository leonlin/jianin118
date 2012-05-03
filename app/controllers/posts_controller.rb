class PostsController < ApplicationController
  before_filter :signed_in_user, only: [:new, :create]
  before_filter :correct_user,   only: [:destroy, :edit, :update]

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(params[:post])
    if @post.save
      flash[:success] = "Post created!"
      redirect_to current_user
    else
      @feed_items = []
      render 'new'
    end
  end

  def destroy
    @post.destroy
    redirect_back_or root_path
  end

  def edit
    @post = Post.find(params[:id])
  end 

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(params[:post])
      flash[:success] = "Post updated"
      redirect_to current_user
    else
      render 'edit'
    end
  end

  private

  def correct_user
    @post = current_user.posts.find_by_id(params[:id])
    redirect_to root_path if @post.nil?
  end
end
