class ChangeArticles2Columns < ActiveRecord::Migration[6.0]
  def change
    remove_column :articles, :image_name, :string
    add_column :articles, :image, :string
  end
end
