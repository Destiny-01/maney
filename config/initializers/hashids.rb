# hashids = Hashids.new()

# Hashid::Rails.configure do |config|
#     config.secret = Rails.application.secrets.secret_key_base
#     config.length = 6
# end


# require 'hashids'

# module HashidsSupport
#   module ClassMethods
#     def hashids
#       Hashids.new(table_name, 5)
#     end

#     def encrypt_id(id)
#       hashids.encrypt(id)
#     end

#     def decrypt_id(id)
#       hashids.decrypt(id).first
#     end
#   end

#   def self.included(base)
#     base.extend ClassMethods
#   end

#   def encrypted_id
#     self.class.encrypt_id(id)
#   end

#   def to_param
#     encrypted_id
#   end
# end

# ActiveRecord::Base.send :include, HashidsSupport