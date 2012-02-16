require "minitest/autorun"
require "webmock/minitest"

require "readonly_party"

class ReadonlyPartyObject; include ReadonlyParty; end

class ReadonlyPartyTest < MiniTest::Unit::TestCase
  describe "a boring party where everyone reads but no one writes" do

    describe "readers" do
      it "can get" do
        stub_request(:get, /http:\/\/www.example.com/).to_return(:status => 200)
        assert ReadonlyPartyObject.get("http://www.example.com")
      end

      it "can head" do
        stub_request(:head, /http:\/\/www.example.com/).to_return(:status => 200)
        assert ReadonlyPartyObject.head("http://www.example.com")
      end

      it "can options" do
        stub_request(:options, /http:\/\/www.example.com/).to_return(:status => 200)
        assert ReadonlyPartyObject.options("http://www.example.com")
      end

      # FUTURE!
      # it "can trace" do
      #   stub_request(:options, /http:\/\/www.example.com/).to_return(:status => 200)
      #   assert ReadonlyPartyObject.trace("http://www.example.com")
      # end
    end

    describe "writers" do
      it "cannot post" do
        assert_raises(HTTPMethodDisallowedException) {
          ReadonlyPartyObject.post("http://www.example.com")
        }
      end

      it "cannot put" do
        assert_raises(HTTPMethodDisallowedException) {
          ReadonlyPartyObject.put("http://www.example.com")
        }
      end

      it "cannot delete" do
        assert_raises(HTTPMethodDisallowedException) {
          ReadonlyPartyObject.delete("http://www.example.com")
        }
      end

      # FUTURE!
      # it "cannot patch" do
      #   assert_raises(HTTPMethodDisallowedException) {
      #     ReadonlyPartyObject.patch("http://www.example.com")
      #   }
      # end
    end

  end
end
