class AddColumnComplints < ActiveRecord::Migration[6.1]
  def change
    add_column :complaints, :anonymous, :boolean
  end
end
