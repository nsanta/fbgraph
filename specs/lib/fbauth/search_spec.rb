require File.expand_path('../../../spec_helper', __FILE__)

describe FBGraph do
  describe FBGraph::Search do

    before :each do
      @client_id = 'client_id'
      @secret_id = 'secret_id'
      @client = FBGraph::Client.new(:client_id => @client_id,
                                    :secret_id => @secret_id)
      @search = FBGraph::Search.new(@client)                              
    end

    describe "initialization" do
      it "should set @object with 'search'" do
        @search.objects.should == 'search'
      end
    end


    describe 'instance methods' do
      
      describe '.query' do
        before(:each) do
          @result = @search.query('query')
        end
        it 'should return self' do
          @result.should == @search
        end
        it "should assign in params[:q] 'query'" do
          @search.params[:q].should == 'query'
        end
      end
      describe '.on' do
        before(:each) do
          @result = @search.on('type')
        end
        it 'should return self' do
          @result.should == @search
        end
        it "should assign in params[:type] 'type'" do
          @search.params[:type].should == 'type'
        end
      end
    end
    
  end
end
