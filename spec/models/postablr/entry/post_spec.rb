# -*- encoding : utf-8 -*-
require 'spec_helper'

describe Postablr::Entry::Post do
  it{should have_one :entry}
end
