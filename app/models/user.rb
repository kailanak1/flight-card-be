class User < ApplicationRecord
    has_many :flight_departs
    has_secure_password
end
