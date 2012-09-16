require "spec_helper"

describe FBGraph do
  describe FBGraph::Canvas do
    before :each do
      @payload = { 'algorithm' => 'HMAC-SHA256', 'foo' => 'bar' }
      @secret = 'thisisasecret'

      encoded_payload = Base64.encode64(@payload.to_json)
      hash = OpenSSL::HMAC.digest('sha256', @secret, encoded_payload)
      encoded_sig = Base64.encode64(hash)

      @valid_request = "#{encoded_sig}.#{encoded_payload}"
    end

    it "should decode a valid request" do
      result = FBGraph::Canvas.parse_signed_request(@secret, @valid_request)
      result.should == @payload
    end

    it "should raise on an invalid request" do
      bad_secret = "notagoodsecret"

      lambda {
        FBGraph::Canvas.parse_signed_request(bad_secret, @valid_request)
      }.should raise_error
    end
  end
end
