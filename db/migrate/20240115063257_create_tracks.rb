class CreateTracks < ActiveRecord::Migration[7.1]
  def change
    create_table :tracks do |t|
      t.string :name
      t.integer :status, default: 0
      t.references :train, null: true, foreign_key: true

      t.timestamps
    end
  end
end
