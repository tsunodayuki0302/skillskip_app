class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string     :telephone_number,  null: false
      
      t.timestamps
    end
  end
end


      # t.references :record, null: false, foreign_key: true