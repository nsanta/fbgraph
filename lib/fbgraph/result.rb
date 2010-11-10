require 'hashie/mash'
require 'json'

module FBGraph
  class Result

    attr_accessor :params, :unparsed, :data

    def initialize(result, params = {}, &block)
      result = result.respond_to?(:body) ? result.body : result.to_s
      @data = Hashie::Mash.new(JSON.parse(result)) rescue result
      @unparsed = result
      @params = params.symbolize_keys
    end

    # Implement enumerable
    def each(&block)
      return nil if data.blank?
      data.each(&block)
    end
    include Enumerable

    # Implement Comparable
    def <=>(other)
      (data <=> other.data) rescue 0
    end
    include Comparable

  end
end
