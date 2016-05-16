class Video < ActiveRecord::Base
	has_attached_file :image, :styles => {:small => "100*100"}
validates_attachment_presence :image
validates_attachment_content_type :image, :content_type => [ 'image/png','image/jpeg','image/jpeg']

has_attached_file :document
validates_attachment_presence :document
validates_attachment_content_type :document, :content_type => [ 'application/pdf','text/plain']

has_attached_file :audio
validates_attachment_presence :audio
validates_attachment_content_type :audio, :content_type => [ 'audio/mp3','audio/mpeg']
end
