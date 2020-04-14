class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.integer :user_id
      t.text :content
      t.string :image_name

      t.timestamps
    end
  end
end
