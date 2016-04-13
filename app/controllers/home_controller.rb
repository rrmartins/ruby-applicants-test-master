class HomeController < ApplicationController
  before_filter :parse, only: :index
  before_filter :save_brands, only: :index

  def index
    @makes = Make.select(:webmotors_id, :name).all
  end

  private
  def parse
    @json = RubyApplicants::Url.new("http://www.webmotors.com.br/carro/marcas").parse
  end

  def save_brands
    Make.save_brands(@json)
  end
end
