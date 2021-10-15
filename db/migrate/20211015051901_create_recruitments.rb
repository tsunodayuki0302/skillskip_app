class CreateRecruitments < ActiveRecord::Migration[6.0]
  def change
    create_table :recruitments do |t|
      t.string  :heading,       null:false
      t.string  :content,     null:false
      t.integer :category_id, null:false
      t.string  :title,       null:false
      t.timestamps
    end
  end
end