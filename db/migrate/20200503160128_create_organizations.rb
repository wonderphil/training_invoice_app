class CreateOrganizations < ActiveRecord::Migration[6.0]
  def change
    create_table :organizations do |t|
      t.string :name
      t.string :address
      t.string :tax_payer_number
      t.string :slub

      t.timestamps
    end
    add_index :organizations, :slub, unique: true
  end
end
