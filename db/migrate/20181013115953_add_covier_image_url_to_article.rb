class AddCovierImageUrlToArticle < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :cover_image_url, :string
  end
end
