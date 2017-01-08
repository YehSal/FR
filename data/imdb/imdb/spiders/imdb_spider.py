import scrapy
import pdb


# To construct full absolute url paths
try:
    from urlparse import urljoin  # Python2
except ImportError:
    from urllib.parse import urljoin  # Python3


class ImdbSpider(scrapy.Spider):
    name = "imdb"
    def start_requests(self):
        urls = [
        'http://www.imdb.com/title/tt0120596/fullcredits',
        ]
        for url in urls:
            yield scrapy.Request(url=url, callback=self.parse)

    def parse(self, response):
        show = ' '.join(response.css("div.parent h3 a::text").extract_first().split())

        for actor in response.css('tr.odd'):
            char_name = actor.css('td.character a::text').extract_first()
            homepage = 'http://www.imdb.com'

            link = urljoin(
                homepage,
            ' '.join(actor.css('td.primary_photo a::attr(href)').extract_first().split()))

            if char_name == None:
                yield {
                    'real_name':
                    ' '.join(actor.css('td.itemprop a span.itemprop::text').extract_first().split()),
                    'character_name':
                    ' '.join(actor.css('td.character div::text').extract_first().split()),
                    'imdb_link': link,
                    'show': show,
                }
            else:
                yield {
                    'real_name':
                    ' '.join(actor.css('td.itemprop a span.itemprop::text').extract_first().split()),
                    'character_name':
                    ' '.join(actor.css('td.character a::text').extract_first().split()),
                    'imdb_link': link,
                    'show': show,
                }

        for actor in response.css('tr.even'):
            char_name = actor.css('td.character a::text').extract_first()
            if char_name == None:
                link = response.urljoin(' '.join(actor.css('td.primary_photo a::attr(href)').extract_first().split()))
                yield {
                    'real_name':
                    ' '.join(actor.css('td.itemprop a span.itemprop::text').extract_first().split()),
                    'character_name':
                    ' '.join(actor.css('td.character div::text').extract_first().split()),
                    'imdb_link': link,
                    'show': show,
                }
            else:
                yield {
                    'real_name':
                    ' '.join(actor.css('td.itemprop a span.itemprop::text').extract_first().split()),
                    'character_name':
                    ' '.join(actor.css('td.character a::text').extract_first().split()),
                    'imdb_link': link,
                    'show': show,
                }


# real name: actor.css('td.itemprop').css('a').css('span.itemprop::text').extract_first()
# character: actor.css('td.character').css('a::text').extract_first()
# link in imdb: actor.css('td.primary_photo a::attr(href)').extract_first()
