class AddIdToInstruments < ActiveRecord::Migration[5.1]
  def change
    add_column :instruments, :id, :primary_key
  end
end
