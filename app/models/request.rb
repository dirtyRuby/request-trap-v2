class Request < ActiveRecord::Base
  serialize :headers, JSON
  belongs_to :trap
end
