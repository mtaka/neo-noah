class AddColumnsToArticle < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :type, :string
  end
end
