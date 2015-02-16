class Request < ActiveRecord::Base
  serialize :headers, JSON
  serialize :cookies, JSON
  #
  # One-to-many dependency.
  #
  belongs_to :trap
end
