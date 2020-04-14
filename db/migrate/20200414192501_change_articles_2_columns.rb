class ChangeArticles2Columns < ActiveRecord::Migration[6.0]
  def change
    remove_column :articles, :image_name, :string
  end
end
