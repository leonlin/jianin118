class AddBlogTitleToUsers < ActiveRecord::Migration
  def change
    add_column :users, :blog_title, :string
  end
end
