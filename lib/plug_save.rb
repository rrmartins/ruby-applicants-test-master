module Plug
  class Save
    def initialize(model, json)
      @model = model
      @json  = json
    end

    def save_data(make_id=nil)
      @json.each do |params|
        key   = validate_key_value(make_id, :webmotors_id, :make_id)
        value = validate_key_value(make_id, params["Id"], make_id)
        @model.find_or_create_by(name: params["Nome"], key.to_sym => value)
      end
    end

    private
    def validate_key_value(make_id, obj1, obj2)
      make_id.nil? ? obj1 : obj2
    end
  end
end
