require 'users_helper'

class User < ApplicationRecord
  belongs_to :referrer, class_name: 'User', foreign_key: 'referrer_id', required: false
  has_many :referrals, class_name: 'User', foreign_key: 'referrer_id'

  validates :email, presence: true, uniqueness: true, format: {
    with: /\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/i,
    message: 'Invalid email format.'
  }

  before_create :create_referral_code
  before_create :downcase_email

  private

  def downcase_email
    self.email.downcase!
  end

  def create_referral_code
    self.referral_code = UsersHelper.unused_referral_code
  end
end
