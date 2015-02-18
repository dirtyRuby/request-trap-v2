class ChangeRequestsColumnsCookiesQueryParams < ActiveRecord::Migration
  def up
    change_column :requests, :cookies, :binary
    change_column :requests, :query_params, :binary
  end

  def down
    change_column :requests, :cookies, :string
    change_column :requests, :query_params, :string
  end
end
