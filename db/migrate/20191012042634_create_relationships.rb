class CreateRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :relationships do |t|
      t.references :user, foreign_key: true
      t.references :partner, foreign_key: {to_table: :users}
      t.string :status
      t.string :secret_words

      t.timestamps
      
      t.index [:user_id, :partner_id], unique: true
    end
  end
end
