class Trap < ActiveRecord::Base
  #
  # One-to-many dependency. If destroy traps =>
  # all dependent requests wil be destroyed.
  #
  has_many :requests, dependent: :destroy
end
