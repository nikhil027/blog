class Article < ActiveRecord::Base

	has_many :article_categories
	has_many :categories, through: :article_categories
	has_many :comments
	belongs_to :user

	validates_presence_of :title, :body
	validates_uniqueness_of :title
	validates_associated :category_ids
	

end
