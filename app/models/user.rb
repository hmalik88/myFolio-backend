class User < ApplicationRecord
  has_secure_password
  has_many :transactions
  validates :e_mail, uniqueness: {case_sensitive: false}

end
