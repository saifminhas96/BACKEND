class User < ApplicationRecord
    has_secure_password

   

    validates :firstname, presence: true
    validates :lastname, presence: true
    validates :email, uniqueness: {case_sensitive: false}
    validates_format_of :email, with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
end
