class AddReferenceToOrganizationFromAccount < ActiveRecord::Migration[6.0]
  def change
    add_reference :organizations, :account, index: true, foreign_key: true
  end
end
