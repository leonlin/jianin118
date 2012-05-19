class StaticPagesController < ApplicationController
  def home
    @feed_items = Post.all.paginate(page: params[:page])
  end

  def about
  end
end
