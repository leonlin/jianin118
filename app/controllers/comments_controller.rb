class CommentsController < ApplicationController

  respond_to :html, :js

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(params[:comment])
    if verify_recaptcha(:model => @comment, :message => "Oh! It's error with reCAPTCHA!") && @flag = @comment.save
      respond_with @comment, location: post_path(@post.id)
    end
  end
end
