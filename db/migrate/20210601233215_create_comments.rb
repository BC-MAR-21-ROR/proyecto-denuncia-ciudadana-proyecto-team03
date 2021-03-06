class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.text :content
      t.boolean :anonymous, default: false
      t.references :user, null: false, foreign_key: true
      t.references :complaint, null: false, foreign_key: true

      t.timestamps
    end
  end
end
