require "readonly_party/version"
require "httparty"

class HTTPMethodDisallowedException < StandardError; end

module ReadonlyParty
  module ClassMethods
    def post(*args)
      raise HTTPMethodDisallowedException.new
    end

    def put(*args)
      raise HTTPMethodDisallowedException.new
    end

    def delete(*args)
      raise HTTPMethodDisallowedException.new
    end

    # Technically, HTTParty doesn't do patch yet. Enable... in the FUTURE!
    # def patch(*args)
    #   raise HTTPMethodDisallowedException.new
    # end
  end

  def self.included(base)
    base.send(:include, HTTParty)
    base.send(:extend, ClassMethods)
  end
end
