class Model < ActiveRecord::Base

  def self.save_models(json, make_id)
    Plug::Save.new(self, json).save_data(make_id)
  end
end
