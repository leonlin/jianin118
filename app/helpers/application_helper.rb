module ApplicationHelper

  # Returns the full title on a per-page basis.
  def full_title(page_title)
    base_title = "Jian in Studio 118"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

  def url_with_protocol(url)
    /^http/.match(url) ? url : "http://#{url}"
  end

end
