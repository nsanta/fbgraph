require File.expand_path('../../../spec_helper', __FILE__)

describe FBGraph do
  describe FBGraph::Selection do

    before :each do
      @client_id = 'client_id'
      @secret_id = 'secret_id'
      @token = 'token'
      @client = FBGraph::Client.new(:client_id => @client_id,
                                    :secret_id => @secret_id,
                                    :token => @token)
      @selection = FBGraph::Selection.new(@client)
    end
    
    describe "when asking for an object's picture" do
      it "should append the access token" do
        @selection.me.picture.should ==
            "https://graph.facebook.com/me/picture?access_token=#{@token}"
      end
      
      it "should not append an access token if none is available" do
        client = FBGraph::Client.new(:client_id => @client_id,
                                     :secret_id => @secret_id)
        selection = FBGraph::Selection.new(client)                              

        selection.me.picture.should ==
            "https://graph.facebook.com/me/picture"
      end
    end
  end  
end
