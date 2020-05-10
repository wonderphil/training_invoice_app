class CreateContacts < ActiveRecord::Migration[6.0]
  def change
    create_table :contacts do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.references :organization, index: true, foreign_key: true

      t.timestamps
    end
  end
end