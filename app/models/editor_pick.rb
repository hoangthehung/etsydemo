class EditorPick < ActiveRecord::Base
	has_and_belongs_to_many :listings
end
