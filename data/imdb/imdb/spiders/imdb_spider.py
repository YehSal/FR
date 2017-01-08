import scrapy
import pdb

class ImdbSpider(scrapy.Spider):
    name = "imdb"
    def start_requests(self):
        urls = [
        'http://www.imdb.com/title/tt0120596/fullcredits',
        ]
        for url in urls:
            yield scrapy.Request(url=url, callback=self.parse)

    def parse(self, response):
        for actor in response.css('tr.odd'):
            char = actor.css('td.character a::text').extract_first()
            if char == None:
                yield {
                    'real_name': actor.css('td.itemprop a span.itemprop::text').extract_first().strip(),
                    'character_name': actor.css('td.character div::text').extract_first().strip(),
                    'imdb_link': actor.css('td.primary_photo a::attr(href)').extract_first(),
                }
            else:
                yield {
                    'real_name': actor.css('td.itemprop a span.itemprop::text').extract_first().strip(),
                    'character_name': actor.css('td.character a::text').extract_first().strip(),
                    'imdb_link': actor.css('td.primary_photo a::attr(href)').extract_first(),
                }

        for actor in response.css('tr.even'):
            char = actor.css('td.character a::text').extract_first()
            if char == None:
                yield {
                    'real_name': actor.css('td.itemprop a span.itemprop::text').extract_first().strip(),
                    'character_name': actor.css('td.character div::text').extract_first().strip(),
                    'imdb_link': actor.css('td.primary_photo a::attr(href)').extract_first(),
                }
            else:
                yield {
                    'real_name': actor.css('td.itemprop a span.itemprop::text').extract_first().strip(),
                    'character_name': actor.css('td.character a::text').extract_first().strip(),
                    'imdb_link': actor.css('td.primary_photo a::attr(href)').extract_first(),
                }


# real name: actor.css('td.itemprop').css('a').css('span.itemprop::text').extract_first()
# character: actor.css('td.character').css('a::text').extract_first()
# link in imdb: actor.css('td.primary_photo a::attr(href)').extract_first()
