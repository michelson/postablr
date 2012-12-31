require 'spec_helper'

describe Postablr::Entry::Link do
  it{should have_one :entry}
end
