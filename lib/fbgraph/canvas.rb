module Fbgraph
  
  class Canvas
    
    class << self
      def parse_signed_request(secret_id,request)
        encoded_sig, payload = request.split('.', 2)
        sig = ""
        urldecode64(encoded_sig).each_byte { |b|
          sig << "%02x" % b
        }
        data = JSON.parse(urldecode64(payload))
          if data['algorithm'].to_s.upcase != 'HMAC-SHA256'
          raise "Bad signature algorithm: %s" % data['algorithm']
        end
        expected_sig = OpenSSL::HMAC.hexdigest('sha256', secret_id, payload)
        if expected_sig != sig
          raise "Bad signature"
        end
        data
      end
      
      private
      
      def urldecode64(str)
        encoded_str = str.gsub('-','+').gsub('_','/')
        encoded_str += '=' while !(encoded_str.size % 4).zero?
        Base64.decode64(encoded_str)
      end
    end  
    
  end
  
end
