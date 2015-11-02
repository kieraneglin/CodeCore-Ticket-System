class SetStatusDefaultValue < ActiveRecord::Migration
  def change
    change_column :tickets, :status, :boolean, :default => 0
  end
end
