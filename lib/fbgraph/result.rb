require 'hashie/mash'

module FBGraph
  class Result

    attr_accessor :params, :unparsed, :data

    def initialize(result, params = {}, &block)
      result = result.respond_to?(:body) ? result.body : result.to_s
      @data = Hashie::Mash.new(JSON.parse(result)) rescue result
      @unparsed = result
      @params = params.symbolize_keys      
      self
    end

    def paging
      data.paging
    end

    def metadata
      data.metadata
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

    def method_missing(method, *args, &block)
      data.send(method, *args, &block) rescue super(method, *args, &block)
    end
  end
end
