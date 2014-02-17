
module Middleman
  module MetaTags
    module Helpers

      META_TAGS_TO_PREPARE = [:description, :rel_author, :rel_publisher, :og_type, :og_image, :og_url, :fb_admins]

      def display_meta_tags(user_set_defaults={})
        meta_tags = user_set_defaults.merge(self.meta_tags)
        tag_results_array = []

        title = build_full_title(meta_tags) # should delete title?
        tag_results_array << content_tag(:title, title) unless title.blank?

        tag_results_array << meta_tag(name: 'description', content: meta_tags[:description])

        tag_results_array << meta_link(rel: 'author',             href: meta_tags[:rel_author])
        tag_results_array << meta_link(rel: 'publisher',          href: meta_tags[:rel_publisher])
        
        tag_results_array << meta_tag(property: 'og:title',       content: meta_tags[:title])     
        tag_results_array << meta_tag(property: 'og:type',        content: meta_tags[:og_type])   
        tag_results_array << meta_tag(property: 'og:image',       content: meta_tags[:og_image])  
        tag_results_array << meta_tag(property: 'og:url',         content: meta_tags[:og_url])    
        tag_results_array << meta_tag(property: 'og:description', content: meta_tags[:description])
        tag_results_array << meta_tag(property: 'fb:admins',      content: meta_tags[:fb_admins]) 
  
        tag_results_array << meta_tag(name: 'twitter:card',        content: meta_tags[:description])
        tag_results_array << meta_tag(name: 'twitter:url',         content: meta_tags[:og_url])
        tag_results_array << meta_tag(name: 'twitter:title',       content: meta_tags[:title])
        tag_results_array << meta_tag(name: 'twitter:description', content: meta_tags[:description])
        
        if defined? :thumbnail_url && meta_tags[:og_image]
          url = thumbnail_url(blog_prefix + meta_tags[:og_image], :twitter_card)
          tag_results_array << tag(:meta, :name => 'twitter:image', :content => url)
        end

        # TODO: Schema.Org stuff

        results = tag_results_array.join("\n")
      end

      def meta_tags
        @meta_tags ||= Hash.new
      end

      def set_meta_tags(new_meta_tags = {})
        self.meta_tags.merge!(new_meta_tags)
      end

      def meta_title
        content_tag 'title', site_title
      end
 
      def title(title = nil, headline = '')
        set_meta_tags(:title => title) unless title.nil?
        headline.blank? ? meta_tags[:title] : headline
      end

      META_TAGS_TO_PREPARE.each do |name|
        define_method name do |text|
          set_meta_tags(name => text)
          text
        end
      end

      private

      def meta_link(rel: nil, href: nil)
        if href
          tag(:link, rel: rel, href: href) if href
        end
      end

      def meta_tag(name: nil, property: nil, content: nil)
        if content
          if name
            return tag(:meta, :name => name, :content => content)
          end
          if property
            return tag(:meta, :property => property, :content => content)
          end
        end
      end

      def link_rel
        
      end

      def build_full_title(meta_tags)
        meta_tags[:title] || meta_tags[:site]
      end

    end
  end
end