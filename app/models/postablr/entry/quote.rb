module Postablr
  class Entry::Quote < ActiveRecord::Base
    attr_accessible :body, :source
    has_one :entry, :as => :postable
    validates_presence_of :body
  end


    def to_s
      self.body
    end

end
