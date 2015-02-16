class Request < ActiveRecord::Base
  serialize :headers, JSON
  #
  # One-to-many dependency.
  #
  belongs_to :trap
end
