class Bug < ApplicationRecord
	belongs_to :project
	belongs_to :user
	has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
	validates_attachment_content_type :avatar, content_type: ["image/png", "image/gif"],
	not: ["text/html", "text/xml", "application/octet-stream", "application/exe"]
end