class Contact
  include ActiveModel::Model
  attr_accessor :name, :email, :phone, :message

  validates :name, :phone, :message, presence: true
  validates :email, presence: true, format: {
    with: /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i,
    message: 'Invalid email format.'
  }
end
