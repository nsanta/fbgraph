require "spec_helper"

describe FBGraph do
  describe FBGraph::Authorization do

    before :each do
      @client_id = 'client_id'
      @secret_id = 'secret_id'
      @client = FBGraph::Client.new(:client_id => @client_id,
                                    :secret_id => @secret_id,
                                    :token => 'token')
      @base = FBGraph::Base.new(@client)
      
    end

    describe 'initialization' do
      it 'should set the client' do
        @base.instance_variable_get("@client").should == @client
      end
      it 'should params be empty' do
        @base.params.should be_empty
      end
    end

    describe "instance methods" do
      describe 'find' do
        it 'should objects set with "id"' do
          @base.find('id').objects.should == 'id'
        end
      end

      describe 'connection' do
        it 'should set connection_type to "type"' do
          @base.connection('type').connection_type.should == 'type'
        end
      end

      describe 'params=' do
        it 'should set params to {:fields => "fields"}' do
          @base.params = {:fields => "fields"}
          @base.params.should == {:fields => "fields"}
        end
      end

      describe 'params' do
        it 'should return params' do
          @base.params = {:fields => "fields"}
          @base.params.should == {:fields => "fields"}
        end
      end

      describe 'param' do
        it 'should merge the passed param' do
          @base.params = {:fields => "fields"}
          @base.param(:merged => true)
          @base.params.should == {:fields => "fields" , :merged => true}
        end
      end

      describe 'info!' do
        describe 'when object is an array' do
          it 'should request with the path "/?ids=1,2,3"' do
            uri = "?access_token=token&ids=1,2,3"
            @base.find([1,2,3])
            expect_consumer(uri)
            @base.info!(false)
          end
        end

        describe 'when object is a string' do

          it 'should request with the path "/123"' do
            uri = "123?access_token=token"
            @base.find('123')            
            expect_consumer(uri)                        
            @base.info!(false)
          end
          
          it "should parse the result by default" do
            uri = "123?access_token=token"
            @base.find('123')
            expect_consumer(uri, '{"me": [1, 2]}')
            @base.info!.me.should == [1, 2]
          end
          
          describe 'when a connection is passed' do
            it 'should request with the path "/123/home"' do
              uri = "123/home?access_token=token"
              @base.find('123').connection('home')
              expect_consumer(uri)
              @base.info!(false)
            end
          end

          describe 'when params are passed' do
            it 'should request with the path "/123?fields=name,picture"' do
              uri = "123?fields=name,picture&access_token=token"
              @base.find('123')
              @base.params = {:fields => "name,picture"}
              expect_consumer(uri)
              @base.info!(false)
            end
          end
        end
      end

      describe 'publish!' do
        describe 'when is passed params before invocation' do
          it 'should request with the path "/123" and params {:extra => "extra" }' do
            uri = "123"
            @base.find('123')
            @base.params = {:extra => "extra" }
            #@client.consumer.stub!(:post).with(uri , @base.params).and_return('')
            expect_consumer_post(uri, {:extra => "extra", :access_token => 'token'})
            @base.publish!({}, false)
        end
        end
        describe 'when is passed params on invocation' do
          it 'should request with the path "/123" and params {:extra => "extra" }' do
            uri = "123"
            @base.find('123')
            ps = {:extra => "extra"}
            expect_consumer_post(uri, {:extra => "extra", :access_token => 'token'})
            @base.publish!(ps, false)
          end
        end
      end

      describe 'delete!' do
        it 'should request with the path "/123" and params {:extra => "extra" }' do
          uri = "123"
          @base.find('123')
          @base.params = {:extra => "extra" }
          expect_consumer_post(uri, {:method => :delete, :extra => "extra", :access_token => 'token'})
          @base.delete!(false)
        end
      end
      
    end

  end
end
