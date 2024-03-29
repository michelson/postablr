# -*- encoding : utf-8 -*-
module Postablr
  class Entry::Post < ActiveRecord::Base
    attr_accessible :body, :body, :title
    has_one :entry, :as => :postable
    validates_presence_of :title
    validates_presence_of :body
  end


    def to_s
      self.title
    end

end
