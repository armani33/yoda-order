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

  REFERRAL_STEPS = [
    {
      'count' => 5,
      'html' => '3Km',
      'class' => 'two',
      # 'image' =>  ActionController::Base.helpers.asset_path(
      #   'refer/cream-tooltip@2x.png')
    },
    {
      'count' => 10,
      'html' => '8Km',
      'class' => 'three',
      # 'image' => ActionController::Base.helpers.asset_path(
      #   'refer/truman@2x.png')
    },
    {
      'count' => 25,
      'html' => '25Km<br>+ 1 T-shirt',
      'class' => 'four',
      # 'image' => ActionController::Base.helpers.image_path("reduc_3.png")
    },
    {
      'count' => 50,
      'html' => '60km<br>+ 1 T-shirt',
      'class' => 'five',
      # 'image' => ActionController::Base.helpers.asset_path(
      #   'refer/blade-explain@2x.png')
    }
  ]

  private

  def downcase_email
    self.email.downcase!
  end

  def create_referral_code
    self.referral_code = UsersHelper.unused_referral_code
  end
end
