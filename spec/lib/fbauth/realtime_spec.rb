require "spec_helper"

describe FBGraph do
  describe FBGraph::Realtime do

    before :each do
      @client_id = 'client_id'
      @secret_id = 'secret_id'
      @client = FBGraph::Client.new(:client_id => @client_id,
                                    :secret_id => @secret_id)
      @search = FBGraph::Search.new(@client)                              
    end
  end  
end
