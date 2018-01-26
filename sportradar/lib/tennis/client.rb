require 'net/http'
require_relative '../constants'

module Sportradar
  module Tennis
    # Sportsradar tennis API client library
    class Client
      attr_reader :access,
                  :locale,
                  :options,
                  :response_format,
                  :version

      def self.base_uri
        BASE_API_URL + "tennis-#{access}#{version}/#{locale}"
      end

      def initialize(access: ACCESS[:trial], locale: LANGUAGES[:english])
        @access = access
        @locale = locale
        @response_format = API_RESPONSE_FORMAT[:json]
        @version = API_VERSION_FOR_SPORT[:tennis]
        @options = { query: { api_key: API_KEYS[:tennis] } }
      end

      # GET match results for given day
      #
      # Params:
      #          day:   DD
      #          month: MM
      #          year:  YYYY
      #
      # Ex: results(day: '02', month: '05', year: '2017')
      def results(day:, month:, year:)
        date = "#{year}-#{month}-#{day}"

        uri = URI("/schedules/#{date}/results.#{response_format}?api_key=#{API_KEYS[:tennis]}")
        response = Net::HTTP.get_response(uri)

        puts response.status unless response.is_a?(Net::HTTPSuccess)
        puts response.body
      end
    end
  end
end
