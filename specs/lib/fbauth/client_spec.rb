require File.expand_path('../../../spec_helper', __FILE__)

describe FBGraph do
  describe FBGraph::Client do
    describe "initialization" do
      before :each do
        @client_id = 'client_id'
        @secret_id = 'secret_id'
      end
      describe 'default' do
        
        before :each do
          @client = FBGraph::Client.new(:client_id => @client_id,
                                        :secret_id => @secret_id)
        end
      
        it 'should set the client_id' do
          @client.client_id.should == @client_id
        end
        it 'should set the secret_id' do
          @client.secret_id.should == @secret_id
        end
        it 'should set the facebook_uri ' do
          @client.facebook_uri.should == "https://graph.facebook.com"
        end
      end
      
      describe 'when token is present' do
        before :each do
          @token = 'token'
          @client = FBGraph::Client.new(:client_id => @client_id,
                                        :secret_id => @secret_id,
                                        :token => @token)
        end
        
        it 'should set the access_token' do
          @client.access_token.should == @token
        end
        it 'should set the consumer client' do
          @client.consumer.class.should == OAuth2::AccessToken
        end
      end
    end


    describe "instance methods" do
      before :each do
        @client_id = 'client_id'
        @secret_id = 'secret_id'
        @client = FBGraph::Client.new(:client_id => @client_id,
                                      :secret_id => @secret_id)
      end
      describe '.authorization' do
        it 'should return a FBGraph::Authorization object' do
          @client.authorization.class.should == FBGraph::Authorization
        end
      end

      describe '.selection' do
        it 'should return a FBGraph::Selection object' do
          @client.selection.class.should == FBGraph::Selection
        end
      end

      describe '.search' do
        it 'should return a FBGraph::Search object' do
          @client.search.class.should == FBGraph::Search
        end
      end

      describe '.realtime' do
        it 'should return a FBGraph::Search object' do
          @client.realtime.class.should == FBGraph::Realtime
        end
      end

      describe '.oauth_client' do
        it 'should return a OAuth2::Client object' do
          @client.oauth_client.class.should == OAuth2::Client
        end
      end
    end
  end
end
