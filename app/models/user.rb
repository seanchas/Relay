class User
  include NoBrainer::Document
  include NoBrainer::Document::Timestamps
  include ActiveModel::SecurePassword

  extend Dragonfly::Model

  field :name,              type: String
  field :occupation,        type: String
  field :password,          type: String
  field :password_digest,   type: String

  dragonfly_accessor :avatar

  has_secure_password

end
