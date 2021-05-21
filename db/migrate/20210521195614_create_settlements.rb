class CreateSettlements < ActiveRecord::Migration[6.1]
  def change
    create_table :settlements do |t|
      t.references :postal, null: false, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
