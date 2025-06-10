class CreatePatients < ActiveRecord::Migration[7.2]
  def change
    create_table :patients do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.integer :gender
      t.string :email
      t.string :phone

      t.timestamps
    end
  end
end
