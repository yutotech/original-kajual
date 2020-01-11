class CreateHouseworks < ActiveRecord::Migration[5.2]
  def change
    create_table :houseworks do |t|
      t.references :user, foreign_key: true
      t.string :category
      t.string :name
      t.integer :goal
      t.string :frequency

      t.timestamps
    end
  end
end
