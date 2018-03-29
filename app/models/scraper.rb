class Scraper

  #main page: doc = Nokogiri::HTML(open("https://www.theguardian.com/us"))
  #categories: categories = doc.css('li.pillars__item')
  #categories.length = 5 (news, opinion, sport, culture, lifestyle)
  #first category = categories[0].css('a').text.strip
  #first link = categories[0].css('a')[0]['href']

  #this will print out each category and link
  #categories.each do |category|
    #puts category.css('a').text.strip
    #puts category.css('a')[0]['href']
  #end

  def scrape_categories
    require 'open-uri'
    doc = Nokogiri::HTML(open("https://www.theguardian.com/us"))
    categories = doc.css('li.pillars__item')
  end

  def make_categories
    scrape_categories.each do |category|
      name = category.css('a').text.strip
      url = category.css('a')[0]['href']
      Category.create(name: name, url: url)
    end
  end

  def scrape_subcategories_and_articles
    require 'open-uri'
    doc = Nokogiri::HTML(open("#{@category.url}"))
    subcategories = doc.css('a.subnav-link')
      #first subcategory = doc.css('a.subnav-link')[0].text.strip
      #first subcategory link = doc.css('a.subnav-link')[0]['href']
    end

  end
