class Request < ActiveRecord::Base
  serialize :headers, JSON
  serialize :cookies, JSON
  serialize :query_params, JSON
  belongs_to :trap
end
