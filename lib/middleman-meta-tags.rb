require "middleman-core"
require "middleman-meta-tags/helpers"

::Middleman::Extensions.register(:meta_tags) do
  require "middleman-meta-tags/extension"
  ::Middleman::MetaTagsExtension
end

