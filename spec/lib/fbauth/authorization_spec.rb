require "spec_helper"

describe FBGraph do
  describe FBGraph::Authorization do

    before :each do
      @client_id = 'client_id'
      @secret_id = 'secret_id'
      @client = FBGraph::Client.new(:client_id => @client_id,
                                    :secret_id => @secret_id)
      @authorization = FBGraph::Authorization.new(@client)
    end

    describe 'initialization' do
      it 'should set the client' do
        @authorization.instance_variable_get("@client").should == @client
      end
    end

    describe "instance methods" do
      describe '.authorize_url' do
        it 'should return the authorization url' do
          @authorization.authorize_url(:redirect_uri => 'redirect/to/path' , 
                                       :scope => 'email,user_photos,friends_photos').should =~ /redirect_uri=redirect%2Fto%2Fpath/
        end
      end
      describe "process_callback" do
        before :each do
          @consumer = mock('Consumer' , :token => 'code')
          options = {:redirect_uri => 'redirect/to/path', :parse=>:query}
          @client.stub!(:oauth_client).and_return(Object.new)
          @client.oauth_client.stub!(:auth_code).and_return(Object.new)
          @client.oauth_client.auth_code.stub!(:get_token).with(@consumer.token, options).and_return(@consumer)
          @token = @authorization.process_callback(@consumer.token, options)
        end
        it 'should return the access_token' do
          @token.should == @consumer.token
        end
        it 'should set the consumer' do
          @client.auth.should == @consumer
        end
      end
    end
    
  end
end
