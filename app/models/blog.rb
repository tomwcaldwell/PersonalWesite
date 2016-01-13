class Blog < ActiveRecord::Base

	validates :title, presence: true, length: { minimum: 3, maximum: 50 }
	validates :content, presence: true, length: { minimum: 10, maximum: 3000 }

	belongs_to :admin

	has_many :comments

	has_attached_file :image, styles: { large: "600x600>", medium: "300x300>", thumb: "150x150#" }

	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

	#attr_accessible :title, :content

	def slug
		title.downcase.gsub(" ", "-")
	end

	def to_param
		"#{id}-#{slug}"
	end
end
