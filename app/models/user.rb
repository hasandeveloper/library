class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
        :jwt_authenticatable,
        :registerable,
        jwt_revocation_strategy: JwtDenylist

  has_many :orders

  validates_presence_of :email, :password
  validates :email, uniqueness: true

end
