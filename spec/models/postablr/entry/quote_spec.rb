require 'spec_helper'

describe Postablr::Entry::Quote do
  it{should have_one :entry}
end
