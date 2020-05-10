class CreateAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :accounts do |t|
      t.string :name
      t.string :slug
      t.string :address
      t.float  :vat_rate
      t.string :tax_payer_id
      t.string :default_currency
      t.references :owner, index: true, foreign_key: { to_table: :users }

      t.timestamps
    end
    add_index :accounts, :slug, unique: true
  end
end
