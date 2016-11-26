require 'httparty'

class DBP_API
  include HTTParty
  base_uri 'www.dbt.io'
  default_timeout 1
  
  def api_key
   "5698c52b5eda5aec091fb6d869ecaa31"
  end

  def handle_timeouts
    begin
      yield
    rescue Net::OpenTimeout, Net::ReadTimeout
      {}
    end
  end
  
  def select_book(book_name, options = {})
    url = "http://dbt.io/library/book?key=#{api_key}&dam_id=ENGESV&v=2"
    self.class.get(url, options)
  end
  
  def select_chapter(chapter_id, options = {})
  	 url = "http://dbt.io/library/book?key=#{api_key}&dam_id=ENGESV&v=2"
  	 self.class.get(url, options)

  def show_text
   "http://dbt.io/text/verse?key=#{}{api_key}&dam_id=ENGESVN2ET&book_id=Matt&chapter_id=3&v=2"
  end

  

 end