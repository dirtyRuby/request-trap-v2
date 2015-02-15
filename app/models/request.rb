class Request < ActiveRecord::Base
  serialize :headers
  #
  # One-to-many dependency.
  #
  belongs_to :trap
end
