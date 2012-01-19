class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.references :purchase
      t.string :reference_number

      t.timestamps
    end
    add_index :invoices, :purchase_id
  end
end
