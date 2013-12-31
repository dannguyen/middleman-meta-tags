
module Middleman
  module MetaTags
    module Helpers

      def display_meta_tags(user_set_defaults={})
        meta_tags = user_set_defaults.merge(self.meta_tags)
        tag_results_array = []

        # title
        title = build_full_title(meta_tags) # should delete title?
        tag_results_array << content_tag(:title, title) unless title.blank?

        # description
        if meta_desc = meta_tags.delete(:description)
          tag_results_array << tag(:meta, :name => :description, :content => meta_desc)
        end

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



      #### public methods
 
      def title(title = nil, headline = '')
        set_meta_tags(:title => title) unless title.nil?
        headline.blank? ? meta_tags[:title] : headline
      end


      def description(desc_str)
        set_meta_tags(:description => desc_str)

        desc_str
      end

      #####
      private

      def build_full_title(meta_tags)
        meta_tags[:title] || meta_tags[:site]
      end


    end
  end
end