class CreateZips < ActiveRecord::Migration[6.1]
  def change
    create_table :zips do |t|
      t.references :settlement, null: false, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
