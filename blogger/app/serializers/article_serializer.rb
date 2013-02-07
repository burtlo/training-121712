class ArticleSerializer < ActiveModel::Serializer
#  attributes :title
  
  has_many :comments
  
  def rating
    100
  end
end

