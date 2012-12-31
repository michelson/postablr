require "postablr/engine"

module Postablr

  def self.setup
    yield self
  end

  mattr_accessor  :user_class,
                  :page_title,
                  :post_per_page,
                  :description,
                  :password
end
