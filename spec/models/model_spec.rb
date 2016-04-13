require 'rails_helper'

RSpec.describe Model, type: :model do
  context "attributes" do
    it { should respond_to(:name) }
    it { should respond_to(:make_id) }
  end

  describe 'find a model' do
    let!(:model) { create(:model) }
    it { expect(Model.all.count).to eq 1}
    it { expect(Model.first.name).to eq model.name}
  end

  describe '.save_models' do
    let!(:json) do
      [
        {"Id"=>2503, "Nome"=>"M-10", "Count"=>0, "NomeAmigavel"=>"m-10"},
        {"Id"=>2641, "Nome"=>"M-10 1/2", "Count"=>0, "NomeAmigavel"=>"m-10-1-2"},
        {"Id"=>2647, "Nome"=>"M-11", "Count"=>0, "NomeAmigavel"=>"m-11"},
        {"Id"=>1122, "Nome"=>"M-12", "Count"=>0, "NomeAmigavel"=>"m-12"},
        {"Id"=>1121, "Nome"=>"M-8", "Count"=>0, "NomeAmigavel"=>"m-8"}
      ]
    end

    it { expect(Model.save_models(json, 2503)).to eq true }

    context 'find brand M-10' do
      before(:each) do
        Model.save_models(json, 2503)
      end
      it { expect(Model.find_by_name("M-10").id).to eq 1 }
      it { expect(Model.find_by_name("M-10").make_id).to eq 2503 }
    end
  end
end
