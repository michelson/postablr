module Postablr
  class Entry::Video < ActiveRecord::Base
    attr_accessible :download_url, :duration,
                    :embed_url, :flv, :service,
                    :thumbnail, :title, :embed_html,
                    :url

    has_one :entry, :as => :postable
    attr_accessor :url
    before_save :check_video

    def check_video
      v = UnvlogIt.new(self.url)
      self.title = v.title
      self.thumbnail = v.thumbnail
      self.embed_url = v.embed_url
      self.duration  = v.duration
      self.download_url = v.download_url
      self.embed_html = v.embed_html("100%", "600")
      self.flv = v.flv
    end

    def embed(width, height, options={})
      embed_html(width=425, height=344, options={})
    end

    def to_s
      self.title
    end

  end

end
