module Postablr
  class Entry::Link < ActiveRecord::Base
    attr_accessible :title, :url
    has_one :entry, :as => :postable
    validates_presence_of :title
    validates_presence_of :url
  end

    def to_s
      self.title
    end

end
