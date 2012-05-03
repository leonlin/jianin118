class StaticPagesController < ApplicationController
  def home
    if signed_in?
      #@micropost  = current_user.microposts.build
      #@post  = current_user.posts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    else
      require 'will_paginate/array' 
      @feed_items = Post.all.paginate(page: params[:page])
    end
  end
end
