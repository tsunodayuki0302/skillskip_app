class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string     :telephone_number,  null: false
      t.references :record,   null: false, foreign_key: true
      t.timestamps
    end
  end
end
