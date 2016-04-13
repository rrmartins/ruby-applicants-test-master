require 'uri'
require 'net/http'
require 'json'

module RubyApplicants
  class Url
    def initialize(url)
      @uri = URI(url)
    end

    def parse(params={})
      JSON.parse Net::HTTP.post_form(@uri, params).body
    end
  end
end
