class AddConfirmedToUsers < ActiveRecord::Migration
  def up
    add_column :users, :confirmed, :boolean, default: false
  end

  def down
    remove_column :users, :confirmed
  end

end
