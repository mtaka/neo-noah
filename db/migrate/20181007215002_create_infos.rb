class CreateInfos < ActiveRecord::Migration[5.2]
  def change
    create_table :infos do |t|
      t.references :article, foreign_key: true
      t.string :role
      t.string :title
      t.text :data
      t.string :data_type

      t.timestamps
    end
  end
end
