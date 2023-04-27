require 'securerandom'
class ShortenedUrl < ApplicationRecord
    validates :short_url, :long_url, presence: true, uniqueness: true

    def self.random_code
        loop do 
            code = SecureRandom.urlsafe_base64
            return code if !ShortenedUrl.exists?(short_url: code)
        end 
    end 

end
