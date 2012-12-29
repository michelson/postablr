module Postablr
  class Engine < ::Rails::Engine
    isolate_namespace Postablr
    config.generators do |g|
      g.test_framework  :rspec,
                        :fixture_replacement => :factory_girl ,
                        :dir => "spec/factories"
      g.integration_tool :rspec
    end
  end
end
