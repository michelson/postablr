module Postablr
  module BlogHelper
    def sanitize_clean(html, truncate = false, link=nil)
      unless truncate
        Sanitize.clean(html, Sanitize::Config::RESTRICTED)
      else
        truncate_html(clean_html( html ), truncate , link )
      end
    end

    def sanitize_strict(html, truncate = false, link=nil)
      unless truncate
        Sanitize.clean(html, Sanitize::Config::RESTRICTED)
      else
        truncate_html(Sanitize.clean(html, Sanitize::Config::RESTRICTED), truncate , link )
      end
    end

    def clean_html(html)
      Sanitize.clean(html, Sanitize::Config::BASIC)
    end

    def sanitize_relaxed(html)
      Sanitize.clean(html, Sanitize::Config::RELAXED)
    end
  end
end
