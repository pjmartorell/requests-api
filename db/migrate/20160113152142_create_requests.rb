class CreateRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :requests, :id => false do |t|
      t.primary_key :reference, limit: 8
      t.integer :amount
      t.integer :days
      t.string :email
      t.string :dni
      t.string :cellphone

      t.timestamps
    end
  end
end
