class ObjectifiedHash

    def initialize hash
        @data = hash.inject({}) do |data, (key,value)|  
            value = ObjectifiedHash.new value if value.kind_of? Hash
            data[key.to_s] = value
            data
        end
    end

    def method_missing key
        if @data.key? key.to_s
            @data[key.to_s]
        else
            nil
        end
    end

end