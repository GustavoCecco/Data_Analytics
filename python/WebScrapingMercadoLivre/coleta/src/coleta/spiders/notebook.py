import scrapy


class NotebookSpider(scrapy.Spider):
    name = "notebook"
    allowed_domains = ["lista.mercadolivre.com.br"]
    start_urls = ["https://lista.mercadolivre.com.br/notebook\?sb\=rb\#D\[A"]
    page_count = 1
    max_page = 10

    def parse(self, response):

        products = response.css('div.ui-search-result__wrapper')

        for product in products:

            prices = product.css('span.andes-money-amount__fraction::text').getall()

            yield {
                'brand': product.css('span.poly-component__brand::text').get(),
                'name': product.css('a.poly-component__title::text').get(),
                'seller': product.css('span.poly-component__seller::text').get(),
                'reviews_rating_number': product.css('span.poly-reviews__rating::text').get(),
                'reviews_amount': product.css('span.poly-reviews__total::text').get(),
                'old_money': prices[0] if len (prices) > 0 else None,
                'new_money': prices[1] if len (prices) > 1 else None
            }

        if self.page_count < self.max_page:
            next_page = response.css('li.andes-pagination__button.andes-pagination__button--next a::attr(href)').get()
            if next_page:
                self.page_count += 1
                yield scrapy.Request(url=next_page,callback=self.parse)
