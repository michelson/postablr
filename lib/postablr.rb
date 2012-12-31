require "postablr/engine"

module Postablr

  def self.setup
    yield self
  end

  mattr_accessor  :user_class,
                  :name,
                  :page_title ,
                  :post_per_page ,
                  :description ,
                  :password
end
