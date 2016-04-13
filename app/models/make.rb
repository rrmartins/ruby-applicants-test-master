class Make < ActiveRecord::Base

  def self.save_brands(json)
    Plug::Save.new(self, json).save_data
  end
end
