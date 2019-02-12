class CreateQuotaValues < ActiveRecord::Migration[5.1]
  def change
    create_table :quota_values do |t|
      t.datetime :date
      t.string :money_type
      t.float :price

      t.timestamps
    end
  end
end
