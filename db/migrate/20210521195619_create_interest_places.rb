class CreateInterestPlaces < ActiveRecord::Migration[6.1]
  def change
    create_table :interest_places do |t|
      t.references :user, null: false, foreign_key: true
      t.references :postal, null: false, foreign_key: true
      t.references :settlement, null: false, foreign_key: true

      t.timestamps
    end
  end
end
