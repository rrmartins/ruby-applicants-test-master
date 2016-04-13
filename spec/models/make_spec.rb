require 'rails_helper'

RSpec.describe Make, type: :model do
  context "attributes" do
    it { should respond_to(:name) }
    it { should respond_to(:webmotors_id) }
  end

  describe 'find a make' do
    let!(:make) { create(:make) }
    it { expect(Make.all.count).to eq 1}
    it { expect(Make.first.name).to eq make.name}
  end

  describe '.save_brands' do
    let!(:json) do
      [
        {"Id"=>2503, "Nome"=>"M-10", "Count"=>0, "NomeAmigavel"=>"m-10"},
        {"Id"=>2641, "Nome"=>"M-10 1/2", "Count"=>0, "NomeAmigavel"=>"m-10-1-2"},
        {"Id"=>2647, "Nome"=>"M-11", "Count"=>0, "NomeAmigavel"=>"m-11"},
        {"Id"=>1122, "Nome"=>"M-12", "Count"=>0, "NomeAmigavel"=>"m-12"},
        {"Id"=>1121, "Nome"=>"M-8", "Count"=>0, "NomeAmigavel"=>"m-8"}
      ]
    end

    it { expect(Make.save_brands(json)).to eq true }

    context 'find brand M-10' do
      before(:each) do
        Make.save_brands(json)
      end
      it { expect(Make.find_by_name("M-10").id).to eq 1 }
      it { expect(Make.find_by_name("M-10").webmotors_id).to eq 2503 }
    end
  end
end
