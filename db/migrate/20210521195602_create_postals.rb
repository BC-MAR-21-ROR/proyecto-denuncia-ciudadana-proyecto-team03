class CreatePostals < ActiveRecord::Migration[6.1]
  def change
    create_table :postals do |t|
      t.references :municipality, null: false, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
