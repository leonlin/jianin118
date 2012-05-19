class CommentsController < ApplicationController

  respond_to :html, :js

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(params[:comment])
    @flag = @comment.save
    respond_with @comment, location: post_path(@post.id)
  end
end
