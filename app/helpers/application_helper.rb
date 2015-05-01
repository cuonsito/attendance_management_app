module ApplicationHelper
  BASE_TITLE = "Attendance Management App"
  
  # ページごとの完全なタイトルを返します。
  def full_title(page_title)
    if page_title.empty?
      BASE_TITLE
    else
      "#{BASE_TITLE} | #{page_title}"
    end
  end
end