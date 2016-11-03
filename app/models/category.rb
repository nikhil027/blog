class Category < ActiveRecord::Base

	acts_as_paranoid

	has_many :article_categories
	has_many :articles, through: :article_categories

	
	
	validates_presence_of :name
	

	

end
