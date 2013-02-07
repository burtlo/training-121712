class Article < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection

  validates :title, length: { minimum: 1 }
  validates :body, length: { minimum: 4 }
  validates :body, length: { minimum: 4 }

  has_many :comments
end
