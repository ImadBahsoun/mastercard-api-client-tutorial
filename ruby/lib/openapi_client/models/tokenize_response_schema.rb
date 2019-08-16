=begin
#MDES for Merchants

#The MDES APIs are designed as RPC style stateless web services where each API endpoint represents an operation to be performed.  All request and response payloads are sent in the JSON (JavaScript Object Notation) data-interchange format. Each endpoint in the API specifies the HTTP Method used to access it. All strings in request and response objects are to be UTF-8 encoded.  Each API URI includes the major and minor version of API that it conforms to.  This will allow multiple concurrent versions of the API to be deployed simultaneously. <br> __Authentication__ Mastercard uses OAuth 1.0a with body hash extension for authenticating the API clients. This requires every request that you send to  Mastercard to be signed with an RSA private key. A private-public RSA key pair must be generated consisting of: <br> 1 . A private key for the OAuth signature for API requests. It is recommended to keep the private key in a password-protected or hardware keystore. <br> 2. A public key is shared with Mastercard during the project setup process through either a certificate signing request (CSR) or the API Key Generator. Mastercard will use the public key to verify the OAuth signature that is provided on every API call.<br>  An OAUTH1.0a signer library is available on [GitHub](https://github.com/Mastercard/oauth1-signer-java) <br>  __Encryption__<br>  All communications between Issuer web service and the Mastercard gateway is encrypted using TLS. <br> __Additional Encryption of Sensitive Data__ In addition to the OAuth authentication, when using MDES Digital Enablement Service, any PCI sensitive and all account holder Personally Identifiable Information (PII) data must be encrypted. This requirement applies to the API fields containing encryptedData. Sensitive data is encrypted using a symmetric session (one-time-use) key. The symmetric session key is then wrapped with an RSA Public Key supplied by Mastercard during API setup phase (the Customer Encryption Key). <br>  Java Client Encryption Library available on [GitHub](https://github.com/Mastercard/client-encryption-java) 

The version of the OpenAPI document: 1.2.9

Generated by: https://openapi-generator.tech
OpenAPI Generator version: 4.1.0

=end

require 'date'

module OpenapiClient
  class TokenizeResponseSchema
    # The MasterCard host that originated the request. Future calls in the same conversation may be routed to this host.  
    attr_accessor :response_host

    # Unique identifier for the response. 
    attr_accessor :response_id

    # The tokenization decision for this digitization request. Must be either APPROVED (Digitization request was approved), DECLINED (Digitization request was declined) OR REQUIRE_ADDITIONAL_AUTHENTICATION Digitization request was approved but optionally requires additional authentication. One or more Authentication methods may be provided). 
    attr_accessor :decision

    attr_accessor :authentication_methods

    # The unique reference allocated to the new Token. Serves as a unique identifier for all subsequent queries or management functions relating to this Token. Provided if the decision was APPROVED or REQUIRE_ADDITIONAL_AUTHENTICATION.    __Max Length:64__ 
    attr_accessor :token_unique_reference

    # The unique reference allocated to the Account Primary Account Number. Provided if the decision was APPROVED or REQUIRE_ADDITIONAL_AUTHENTICATION.  __Max Length:64__ 
    attr_accessor :pan_unique_reference

    attr_accessor :product_config

    attr_accessor :token_info

    attr_accessor :token_detail

    # __CONDITIONAL__<br> Returned in the event of an error and contains the reason the operation failed. Only use if errors object is not present.<br> __Max Length: 32__ 
    attr_accessor :error_code

    # __CONDITIONAL__<br> Returned in the event of an error and contains a description of why the operation failed. Only use if errors object is not present.<br> __Max Length: 32__   
    attr_accessor :error_description

    attr_accessor :errors

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'response_host' => :'responseHost',
        :'response_id' => :'responseId',
        :'decision' => :'decision',
        :'authentication_methods' => :'authenticationMethods',
        :'token_unique_reference' => :'tokenUniqueReference',
        :'pan_unique_reference' => :'panUniqueReference',
        :'product_config' => :'productConfig',
        :'token_info' => :'tokenInfo',
        :'token_detail' => :'tokenDetail',
        :'error_code' => :'errorCode',
        :'error_description' => :'errorDescription',
        :'errors' => :'errors'
      }
    end

    # Attribute type mapping.
    def self.openapi_types
      {
        :'response_host' => :'String',
        :'response_id' => :'String',
        :'decision' => :'String',
        :'authentication_methods' => :'Array<AuthenticationMethods>',
        :'token_unique_reference' => :'String',
        :'pan_unique_reference' => :'String',
        :'product_config' => :'ProductConfig',
        :'token_info' => :'TokenInfo',
        :'token_detail' => :'TokenDetail',
        :'error_code' => :'String',
        :'error_description' => :'String',
        :'errors' => :'Array<Error>'
      }
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      if (!attributes.is_a?(Hash))
        fail ArgumentError, "The input argument (attributes) must be a hash in `OpenapiClient::TokenizeResponseSchema` initialize method"
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!self.class.attribute_map.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `OpenapiClient::TokenizeResponseSchema`. Please check the name to make sure it's valid. List of attributes: " + self.class.attribute_map.keys.inspect
        end
        h[k.to_sym] = v
      }

      if attributes.key?(:'response_host')
        self.response_host = attributes[:'response_host']
      end

      if attributes.key?(:'response_id')
        self.response_id = attributes[:'response_id']
      end

      if attributes.key?(:'decision')
        self.decision = attributes[:'decision']
      end

      if attributes.key?(:'authentication_methods')
        if (value = attributes[:'authentication_methods']).is_a?(Array)
          self.authentication_methods = value
        end
      end

      if attributes.key?(:'token_unique_reference')
        self.token_unique_reference = attributes[:'token_unique_reference']
      end

      if attributes.key?(:'pan_unique_reference')
        self.pan_unique_reference = attributes[:'pan_unique_reference']
      end

      if attributes.key?(:'product_config')
        self.product_config = attributes[:'product_config']
      end

      if attributes.key?(:'token_info')
        self.token_info = attributes[:'token_info']
      end

      if attributes.key?(:'token_detail')
        self.token_detail = attributes[:'token_detail']
      end

      if attributes.key?(:'error_code')
        self.error_code = attributes[:'error_code']
      end

      if attributes.key?(:'error_description')
        self.error_description = attributes[:'error_description']
      end

      if attributes.key?(:'errors')
        if (value = attributes[:'errors']).is_a?(Array)
          self.errors = value
        end
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      invalid_properties = Array.new
      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      true
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          response_host == o.response_host &&
          response_id == o.response_id &&
          decision == o.decision &&
          authentication_methods == o.authentication_methods &&
          token_unique_reference == o.token_unique_reference &&
          pan_unique_reference == o.pan_unique_reference &&
          product_config == o.product_config &&
          token_info == o.token_info &&
          token_detail == o.token_detail &&
          error_code == o.error_code &&
          error_description == o.error_description &&
          errors == o.errors
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    def hash
      [response_host, response_id, decision, authentication_methods, token_unique_reference, pan_unique_reference, product_config, token_info, token_detail, error_code, error_description, errors].hash
    end

    # Builds the object from hash
    # @param [Hash] attributes Model attributes in the form of hash
    # @return [Object] Returns the model itself
    def self.build_from_hash(attributes)
      new.build_from_hash(attributes)
    end

    # Builds the object from hash
    # @param [Hash] attributes Model attributes in the form of hash
    # @return [Object] Returns the model itself
    def build_from_hash(attributes)
      return nil unless attributes.is_a?(Hash)
      self.class.openapi_types.each_pair do |key, type|
        if type =~ /\AArray<(.*)>/i
          # check to ensure the input is an array given that the attribute
          # is documented as an array but the input is not
          if attributes[self.class.attribute_map[key]].is_a?(Array)
            self.send("#{key}=", attributes[self.class.attribute_map[key]].map { |v| _deserialize($1, v) })
          end
        elsif !attributes[self.class.attribute_map[key]].nil?
          self.send("#{key}=", _deserialize(type, attributes[self.class.attribute_map[key]]))
        end # or else data not found in attributes(hash), not an issue as the data can be optional
      end

      self
    end

    # Deserializes the data based on type
    # @param string type Data type
    # @param string value Value to be deserialized
    # @return [Object] Deserialized data
    def _deserialize(type, value)
      case type.to_sym
      when :DateTime
        DateTime.parse(value)
      when :Date
        Date.parse(value)
      when :String
        value.to_s
      when :Integer
        value.to_i
      when :Float
        value.to_f
      when :Boolean
        if value.to_s =~ /\A(true|t|yes|y|1)\z/i
          true
        else
          false
        end
      when :Object
        # generic object (usually a Hash), return directly
        value
      when /\AArray<(?<inner_type>.+)>\z/
        inner_type = Regexp.last_match[:inner_type]
        value.map { |v| _deserialize(inner_type, v) }
      when /\AHash<(?<k_type>.+?), (?<v_type>.+)>\z/
        k_type = Regexp.last_match[:k_type]
        v_type = Regexp.last_match[:v_type]
        {}.tap do |hash|
          value.each do |k, v|
            hash[_deserialize(k_type, k)] = _deserialize(v_type, v)
          end
        end
      else # model
        OpenapiClient.const_get(type).build_from_hash(value)
      end
    end

    # Returns the string representation of the object
    # @return [String] String presentation of the object
    def to_s
      to_hash.to_s
    end

    # to_body is an alias to to_hash (backward compatibility)
    # @return [Hash] Returns the object in the form of hash
    def to_body
      to_hash
    end

    # Returns the object in the form of hash
    # @return [Hash] Returns the object in the form of hash
    def to_hash
      hash = {}
      self.class.attribute_map.each_pair do |attr, param|
        value = self.send(attr)
        next if value.nil?
        hash[param] = _to_hash(value)
      end
      hash
    end

    # Outputs non-array value in the form of hash
    # For object, use to_hash. Otherwise, just return the value
    # @param [Object] value Any valid value
    # @return [Hash] Returns the value in the form of hash
    def _to_hash(value)
      if value.is_a?(Array)
        value.compact.map { |v| _to_hash(v) }
      elsif value.is_a?(Hash)
        {}.tap do |hash|
          value.each { |k, v| hash[k] = _to_hash(v) }
        end
      elsif value.respond_to? :to_hash
        value.to_hash
      else
        value
      end
    end
  end
end
