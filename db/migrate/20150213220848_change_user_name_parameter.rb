class ChangeUserNameParameter < ActiveRecord::Migration
  def up
    rename_column :users, :name, :user_name
  end
end
