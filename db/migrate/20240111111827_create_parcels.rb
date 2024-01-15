class CreateParcels < ActiveRecord::Migration[7.1]
  def change
    create_table :parcels do |t|
      t.float :weight, default: 0.0
      t.float :volume, default: 0.0
      t.integer :status, default: 0
      t.references :owner, null: false, foreign_key: { to_table: :accounts }
      t.references :train, foreign_key: true

      t.timestamps
    end
  end
end
