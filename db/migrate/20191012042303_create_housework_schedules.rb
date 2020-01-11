class CreateHouseworkSchedules < ActiveRecord::Migration[5.2]
  def change
    create_table :housework_schedules do |t|
      t.references :user, foreign_key: true
      t.references :housework, foreign_key: true
      t.string :description
      t.datetime :started_at
      t.datetime :ended_at

      t.timestamps
    end
  end
end
