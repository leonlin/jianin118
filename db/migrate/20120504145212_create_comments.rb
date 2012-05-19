class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :name
      t.string :email
      t.string :url
      t.text :content
      t.integer :post_id

      t.timestamps
    end
    add_index :comments, [:post_id, :created_at]
  end
end
