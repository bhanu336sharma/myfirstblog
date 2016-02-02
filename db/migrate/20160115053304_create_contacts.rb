class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.integer :phone_no
      t.integer :house_no
      t.integer :street_no
      t.string :city
      t.references :student, index: true

      t.timestamps
    end
  end
end
