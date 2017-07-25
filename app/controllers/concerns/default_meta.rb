module DefaultMeta
  extend ActiveSupport::Concern

  included do
    before_action :set_title
  end

  def set_title
    @page_title = "Devcamp Portfolio"
    @seo_keywords = "Mark Wang Portfolio"
  end
end