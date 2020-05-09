class AddDetailsToAccount < ActiveRecord::Migration[6.0]
  def change
    add_column :accounts, :address, :string
    add_column :accounts, :vat_rate, :float
    add_column :accounts, :tax_payer_id, :string
    add_column :accounts, :default_currency, :string
  end
end
