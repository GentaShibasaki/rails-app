class ChangeArticles2Columns < ActiveRecord::Migration[6.0]
  def change
    add_column :articles, :image, :string
    remove_column :articles, :image_name, :string
  end
end
