class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :address1
      t.string :address2
      t.string :district
      t.string :state
      t.integer :pincode
      t.integer :user_id

      t.timestamps
    end
  end
end
