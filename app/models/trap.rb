class Trap < ActiveRecord::Base
  #
  # One-to-many dependency. If destroy trap =>
  # all dependent requests wil be destroyed.
  #
  has_many :requests, dependent: :destroy
end
