# frozen_string_literal: true

RSpec.describe Dry::Inflector do
  subject do
    Dry::Inflector.new do |inflect|
      inflect.acronym('API', 'RESTful', 'RoR', 'PhD', 'W3C', 'SSL', 'HTML')
    end
  end

  describe 'acronyms' do
    it 'uses acronyms' do
      aggregate_failures do
        # These examples were taken from ActiveSupport's test suite
        #  camelize             underscore            humanize
        [
          ['API',               'api',                'API'],
          ['APIController',     'api_controller',     'API controller'],
          ['Nokogiri::HTML',    'nokogiri/html',      'Nokogiri/HTML'],
          ['HTTPAPI',           'http_api',           'HTTP API'],
          ['HTTP::Get',         'http/get',           'HTTP/get'],
          ['SSLError',          'ssl_error',          'SSL error'],
          ['RESTful',           'restful',            'RESTful'],
          ['RESTfulController', 'restful_controller', 'RESTful controller'],
          ['Nested::RESTful',   'nested/restful',     'Nested/RESTful'],
          ['IHeartW3C',         'i_heart_w3c',        'I heart W3C'],
          ['PhDRequired',       'phd_required',       'PhD required'],
          ['IRoRU',             'i_ror_u',            'I RoR u'],
          ['RESTfulHTTPAPI',    'restful_http_api',   'RESTful HTTP API'],
          ['HTTP::RESTful',     'http/restful',       'HTTP/RESTful'],
          ['HTTP::RESTfulAPI',  'http/restful_api',   'HTTP/RESTful API'],
          ['APIRESTful',        'api_restful',        'API RESTful'],

          # misdirection
          ['Capistrano',        'capistrano',         'Capistrano'],
          ['CapiController',    'capi_controller',    'Capi controller'],
          ['HttpsApis',         'https_apis',         'Https apis'],
          ['Html5',             'html5',              'Html5'],
          ['Restfully',         'restfully',          'Restfully'],
          ['RoRails',           'ro_rails',           'Ro rails']
        ].each do |camel, under, human|
          expect(subject.camelize(under)).to eql(camel)
          expect(subject.camelize(camel)).to eql(camel)
          expect(subject.underscore(camel)).to eql(under)
          expect(subject.underscore(under)).to eql(under)
          expect(subject.humanize(human)).to eql(human)
        end
      end
    end
  end
end
