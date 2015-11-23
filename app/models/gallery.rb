class Gallery < ActiveRecord::Base
	belongs_to :pin

	has_attached_file :photo, styles: { large: "500x500>", medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/
  validates :photo, :attachment_presence => true
	validates_attachment_size :photo, :less_than => 1.megabytes
end
