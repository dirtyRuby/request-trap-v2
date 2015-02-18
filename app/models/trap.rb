class Trap < ActiveRecord::Base
  validate presence: true
  has_many :requests, dependent: :destroy
end
