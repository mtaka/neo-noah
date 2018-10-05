class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :subtitle
      t.string :url
      t.text :abstract
      t.text :description

      t.timestamps
    end
  end
end
