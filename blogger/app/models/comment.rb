class Comment < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection

  belongs_to :article
  # 
  # def nonsaved_field
  #   @nonsaved_field
  # end
  # 
  # def nonsaved_field=(value)
  #   @nonsaved_field = value
  # end

end
