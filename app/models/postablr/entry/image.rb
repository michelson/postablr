module Postablr
  class Entry::Image < ActiveRecord::Base
    attr_accessible :body, :photo, :photo_content_type, :photo_size
    has_one :entry, :as => :postable
    mount_uploader :photo, EntryPhotoUploader
    validates_presence_of :photo
    attr_accessor  :filename

    def path=(value)
      uploaded_file = CarrierWave::SanitizedFile.new :tempfile => value,
      :filename => filename,
      :content_type => photo_content_type
      self.photo = uploaded_file
    end

  end
end
