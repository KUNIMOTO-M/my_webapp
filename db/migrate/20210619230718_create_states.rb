class CreateStates < ActiveRecord::Migration[6.1]
  def change
    create_table :states do |t|
      t.integer :reason
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
