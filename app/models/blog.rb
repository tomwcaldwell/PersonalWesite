class Blog < ActiveRecord::Base

	validates :title, presence: true, length: { minimum: 3, maximum: 50 }
	validates :content, presence: true, length: { minimum: 10, maximum: 3000 }

	belongs_to :admin

	#attr_accessible :title, :content

	def slug
		title.downcase.gsub(" ", "-")
	end

	def to_param
		"#{id}-#{slug}"
	end
end
