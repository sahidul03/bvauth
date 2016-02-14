class Department < ActiveRecord::Base
  validates :name, presence: true
  validates :name, uniqueness: true

  has_many :users, :dependent => :destroy
end
