class Listing < ActiveRecord::Base
	has_and_belongs_to_many :categories
	has_and_belongs_to_many :editor_picks
	if Rails.env.development?
		has_attached_file :image, :styles => { :medium => "200x>", :thumb => "100x100>" }, :default_url => "default_image1.gif"
	else
		has_attached_file :image, :styles => { :medium => "200x>", :thumb => "100x100>" }, :default_url => "default_image1.gif",
		:storage => :dropbox,
	    :dropbox_credentials => Rails.root.join("config/dropbox.yml"),
	    :path => ":style/:id_:filename"
	end

	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

	validates :name, :description, :price, presence: true
	validates :price, numericality: { greater_than: 0}
	validates_attachment_presence :image

	belongs_to :user
	belongs_to :link
	

	default_scope ->{ order('created_at' => :DESC) }
	#paginates_per 10
end
