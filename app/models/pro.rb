class Pro < ApplicationRecord
  # Include default devise modules. Others available are:
  #  :lockable, :trackable and 
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :timeoutable
  has_many :codes, dependent: :destroy
end
