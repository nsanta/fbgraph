require File.join(File.dirname(__FILE__),"../../../lib/fbgraph")

describe FBGraph do
  describe FBGraph::RealTime do

    before :each do
      @client_id = 'client_id'
      @secret_id = 'secret_id'
      @client = FBGraph::Client.new(:client_id => @client_id,
                                    :secret_id => @secret_id)
      @search = FBGraph::Search.new(@client)                              
    end
  end  
end
