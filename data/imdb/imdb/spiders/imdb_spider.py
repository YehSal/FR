import scrapy
import pdb


# To construct full absolute url paths
try:
    from urlparse import urljoin  # Python2
except ImportError:
    from urllib.parse import urljoin  # Python3


class ImdbSpider(scrapy.Spider):
    name = "imdb"
    homepage = 'http://www.imdb.com'
    def start_requests(self):
        urls = [
        'http://www.imdb.com/title/tt0120596/fullcredits',
        ]
        for url in urls:
            yield scrapy.Request(url=url, callback=self.parse)

    def parse(self, response):
        for actor in response.css('tr.odd'):
            char = actor.css('td.character a::text').extract_first()
            link = urljoin(
                "http://www.imdb.com",
            ' '.join(actor.css('td.primary_photo a::attr(href)').extract_first().split()))

            if char == None:
                yield {
                    'real_name':
                    ' '.join(actor.css('td.itemprop a span.itemprop::text').extract_first().split()),
                    'character_name':
                    ' '.join(actor.css('td.character div::text').extract_first().split()),
                    'imdb_link': link,
                }
            else:
                yield {
                    'real_name':
                    ' '.join(actor.css('td.itemprop a span.itemprop::text').extract_first().split()),
                    'character_name':
                    ' '.join(actor.css('td.character a::text').extract_first().split()),
                    'imdb_link': link,
                }

        for actor in response.css('tr.even'):
            char = actor.css('td.character a::text').extract_first()
            if char == None:
                link = response.urljoin(' '.join(actor.css('td.primary_photo a::attr(href)').extract_first().split()))
                yield {
                    'real_name':
                    ' '.join(actor.css('td.itemprop a span.itemprop::text').extract_first().split()),
                    'character_name':
                    ' '.join(actor.css('td.character div::text').extract_first().split()),
                    'imdb_link': link,
                }
            else:
                yield {
                    'real_name':
                    ' '.join(actor.css('td.itemprop a span.itemprop::text').extract_first().split()),
                    'character_name':
                    ' '.join(actor.css('td.character a::text').extract_first().split()),
                    'imdb_link': link,
                }


# real name: actor.css('td.itemprop').css('a').css('span.itemprop::text').extract_first()
# character: actor.css('td.character').css('a::text').extract_first()
# link in imdb: actor.css('td.primary_photo a::attr(href)').extract_first()
