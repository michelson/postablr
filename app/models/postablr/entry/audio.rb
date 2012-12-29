module Postablr
  class Entry::Audio < ActiveRecord::Base
    attr_accessible :file, :file_content_type, :file_size
    has_one :entry, :as => :postable
    mount_uploader :file, EntryAudioUploader
    validates_presence_of :file
    attr_accessor :content_type, :filename, :size

    #validates_presence_of :title

    def path=(value)
      logger.info value
      uploaded_file = CarrierWave::SanitizedFile.new :tempfile => value,
      :filename => filename,
      :content_type => content_type
      self.file = uploaded_file
    end

    def audio_title
      title.blank? ? File.basename( file.url ) : title
    end
  end
end
