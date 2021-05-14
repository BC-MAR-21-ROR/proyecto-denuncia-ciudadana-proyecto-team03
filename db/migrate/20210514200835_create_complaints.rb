class CreateComplaints < ActiveRecord::Migration[6.1]
  def change
    create_table :complaints do |t|
      t.string :title
      t.text :description
      t.references :category, null: false, foreign_key: true
      t.date :date_of_events
      t.references :state, null: false, foreign_key: true
      t.references :municipality, null: false, foreign_key: true
      t.references :zip, null: false, foreign_key: true
      t.references :settlement, null: false, foreign_key: true
      t.string :street
      t.string :number

      t.timestamps
    end
  end
end
