class Idea < ActiveRecord::Base
  belongs_to :user, required: true

  has_many :liked_bys, dependent: :destroy
  has_many :liked_users, through: :liked_bys, source: :user
  
  validates :idea, presence: true, length: 1..150
end