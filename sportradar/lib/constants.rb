require 'yaml'
require_relative 'sportradar'

# Constants for Sportsradar client library
module Constants
  SECRETS = YAML.safe_load(File.read(File.expand_path(Sportradar.root.join('secrets.yaml'))))

  BASE_API_URL = 'https://api.sportradar.com/'.freeze

  ACCESS = {
    trial: 't',
    production: 'p'
  }.freeze

  API_KEYS = {
    tennis: SECRETS['api_keys']['tennis']
  }.freeze

  LANGUAGES = {
    albanian: 'sqi',
    arabic: 'ar',
    armenian: 'hye',
    azerbaijan: 'aze',
    belarusian: 'bel',
    bosnian: 'bs',
    brazilian_portuguese: 'br',
    bulgarian: 'bg',
    chinese_simplified: 'zh',
    chinese_traditional: 'zht',
    croatian: 'hr',
    czech: 'cs',
    danish: 'da',
    dutch: 'nl',
    english: 'en',
    estonian: 'et',
    faroese: 'fao',
    finnish: 'fi',
    french: 'fr',
    georgian: 'ka',
    german: 'de',
    greek: 'el',
    hebrew: 'heb',
    hungarian: 'hu',
    icelandic: 'isl',
    indonesian: 'id',
    italian: 'it',
    japanese: 'jp',
    kazakh: 'kaz',
    korean: 'ko',
    latvian: 'lv',
    lithuanian: 'lt',
    macedonian: 'mk',
    malay: 'ms',
    moldavian: 'mol',
    montenegrin: 'me',
    norwegian: 'no',
    polish: 'pl',
    portuguese: 'pt',
    romanian: 'ro',
    russian: 'ru',
    serbian: 'sr',
    serbian_latin: 'srl',
    slovak: 'sk',
    slovenian: 'sl',
    spanish: 'es',
    swahili: 'sw',
    swedish: 'sv',
    thai: 'th',
    turkish: 'tr',
    ukranian: 'ukr',
    vietnamese: 'vi'
  }.freeze

  API_RESPONSE_FORMAT = {
    json: 'json',
    xml: 'xml'
  }.freeze

  API_VERSION_FOR_SPORT = {
    tennis: '2'
  }.freeze
end
