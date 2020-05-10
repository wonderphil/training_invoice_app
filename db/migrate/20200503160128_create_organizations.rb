class CreateOrganizations < ActiveRecord::Migration[6.0]
  def change
    create_table :organizations do |t|
      t.string :name
      t.string :address
      t.string :tax_payer_number
      t.string :slug
      t.references :account, index: true, foreign_key: true
      
      t.timestamps
    end
    add_index :organizations, :slug, unique: true
  end
end
