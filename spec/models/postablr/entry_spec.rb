require 'spec_helper'

describe Postablr::Entry do
  it{should belong_to :user}
  it{should belong_to :postable}
end
