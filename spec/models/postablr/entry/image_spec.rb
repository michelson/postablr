require 'spec_helper'

describe Postablr::Entry::Image do
  it{should have_one :entry}
end
