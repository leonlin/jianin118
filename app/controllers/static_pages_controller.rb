class StaticPagesController < ApplicationController
  def home
    require 'will_paginate/array'
    @feed_items = Post.all.paginate(page: params[:page])
  end

  def about
  end
end
