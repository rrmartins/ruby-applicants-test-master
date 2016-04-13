class ModelsController < ApplicationController
  before_filter :parse, only: :index
  before_filter :select_make, only: :index
  before_filter :save_models, only: :index

  def index
    @models = Model.where(make_id: @make_id)
  end

  private
  def parse
    @json = RubyApplicants::Url.new("http://www.webmotors.com.br/carro/modelos").parse({ marca: params[:webmotors_make_id] })
  end

  def select_make
    @make_id = Make.select(:id).find_by_webmotors_id(params[:webmotors_make_id]).id
  end

  def save_models
    Model.save_models(@json, @make_id)
  end
end
