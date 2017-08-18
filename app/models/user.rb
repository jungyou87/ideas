class User < ActiveRecord::Base
  has_secure_password
  has_many :ideas, dependent: :destroy

  has_many :liked_bys, dependent: :destroy
  has_many :liked_ideas, through: :liked_bys, source: :idea

  validates :name, :alias, presence: true, length: { minimum: 2 }
  validates :email, presence: true, uniqueness: true
  validates :password, length: { minimum: 8 }


end



