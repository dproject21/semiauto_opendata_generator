require 'page-object'

class HashTagPage

  include PageObject

  def initialize(driver)
    super(driver)
    @driver = driver
  end

  def search(word)
    @url = "https://www.facebook.com/hashtag/" + word
    @driver.get(@url)
  end

  def scraper
    while has_browse_end_of_results_footer
      @driver.execute_script("window.scrollBy(0, 100);")
      sleep 0.2
    end

    sleep 10

    File.open('./data.txt', 'w') do |file|
      @driver.find_elements(:class => 'userContentWrapper').each do |element|

        file.puts element.text
        file.puts puts_first_source_url(element)
        file.puts ''
        file.puts puts_first_image_url(element)
        file.puts ''
        file.puts ''
      end
    end
  end

  private

  def has_browse_end_of_results_footer
    end_of_results_footer = @driver.find_elements(:id => 'browse_end_of_results_footer');
    is_end = end_of_results_footer.length == 0
  end

  def puts_first_image_url(element)
    element.find_elements(:tag_name => 'img').each do |img|
      attr = img.attribute('src')
      if attr.index(%r{https://scontent.xx.fbcdn.net/v/t[0-9]+.0-0/})
        return attr
      end
    end
  end

  def puts_first_source_url(element)
    element.find_elements(:tag_name => 'a').each do |a|
      attr = a.attribute('href')
      if attr.include?('photo.php')
        return attr
      end
    end
  end
end
