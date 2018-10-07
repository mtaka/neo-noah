class CreateChapters < ActiveRecord::Migration[5.2]
  def change
    create_table :chapters do |t|
      t.references :article, foreign_key: true
      t.string :role
      t.string :title
      t.string :subtitle
      t.text :body

      t.timestamps
    end
  end
end
