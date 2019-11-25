class User < ApplicationRecord

  validates :email, presence: true, uniqueness: true, format: {
    with: /\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/i,
    message: 'Invalid email format.'
  }

  before_create :downcase_email

  private

  def downcase_email
    self.email.downcase!
  end
end
