class CreateInstruments < ActiveRecord::Migration[5.1]
  def change
    create_table :instruments do |t|
      t.integer :instrument_id
      t.string :instrument_name

      t.timestamps
      add_column :instruments, :id, :primary_key
    end
  end
end
