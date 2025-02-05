import json
from flask_restful import abort, Api, Resource
from flask import Flask

app = Flask(__name__)
api = Api(app)

with open('./country.json', 'r', encoding='utf-8') as f:
    data = json.load(f)
COUNTRIES = data
del data

def abort_if_country_doesnt_exist(country_code):
    if country_code not in COUNTRIES:
        abort(404, message=f'País com código {country_code} não existe')

class Country(Resource):
    def get(self, country_code):
        abort_if_country_doesnt_exist(country_code)
        return COUNTRIES[country_code], 200, {'content-type': 'application/json', 'encoding': 'utf-8'}

    def delete(self, country_code):
        return 405

    def put(self, country_code):
        return 405

class CountryList(Resource):
    def get(self):
        return COUNTRIES

    def post(self):
        return 405

api.add_resource(CountryList, '/country')
api.add_resource(Country, '/country/<string:country_code>')

if __name__ == '__main__':
    app.run(host='0.0.0.0', debug=True)
