class AddEvernoteToCustomers < ActiveRecord::Migration
  def self.up
  	add_column :customers, :evernote, :string
  end

  def self.down
  	remove_column :customers, :evernote
  end
end
