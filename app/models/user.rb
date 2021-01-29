class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :codes, dependent: :destroy
  validates :title, presence: true
  validates :body, presence: true
  

  # INDIVIDUAL_PLANS_LIMIT = 3
  # def over_plan_limit?
  #   self.code? && self.codes.count > INDIVIDUAL_PLANS_LIMIT
  # end

  validate :codes_count_within_limit, on: :create

    def codes_count_within_limit
        if self.user.codes(:reload).count >= 3
            errors.add(:base, 'Exceeded Code Limit. Delete others or upgrade to pro')
        end
    end

end
