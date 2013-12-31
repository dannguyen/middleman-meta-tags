

module Middleman
  class MetaTagsExtension < Extension
    self.defined_helpers = [ Middleman::MetaTags::Helpers ]

    def initialize(app, options_hash={}, &block)
      super
      #app.include MetaMethods
      
      #meta_hash = {}
      #yield meta_hash      
    end


  end
end

require 'middleman-meta-tags/helpers'