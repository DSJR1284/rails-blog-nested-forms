class Post < ActiveRecord::Base
  validates_presence_of :name, :content
  
  belongs_to :user
  has_many :comments
  has_many :post_tags
  has_many :tags, :through => :post_tags

  accepts_nested_attributes_for :tags, reject_if: proc { |attributes| attributes['name'].blank? }

  # def tags_attributes=(tag_info)  
  #   if !tag_info["0"]["name"].blank?
  #     binding.pry
  #   end 
  # end 

end
