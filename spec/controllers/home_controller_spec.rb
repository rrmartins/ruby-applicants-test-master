require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  let!(:json) do
    "
      [
        {\"Id\":0,\"Nome\":\"\",\"Count\":0,\"IsPrincipal\":false,\"Selected\":false,\"NomeAmigavel\":\"\"},
        {\"Id\":2,\"Nome\":\"CHEVROLET\",\"Count\":0,\"IsPrincipal\":false,\"Selected\":false,\"NomeAmigavel\":\"chevrolet\"},
        {\"Id\":4,\"Nome\":\"FIAT\",\"Count\":0,\"IsPrincipal\":false,\"Selected\":false,\"NomeAmigavel\":\"fiat\"},
        {\"Id\":3,\"Nome\":\"FORD\",\"Count\":0,\"IsPrincipal\":false,\"Selected\":false,\"NomeAmigavel\":\"ford\"},
        {\"Id\":16,\"Nome\":\"HONDA\",\"Count\":0,\"IsPrincipal\":false,\"Selected\":false,\"NomeAmigavel\":\"honda\"},
        {\"Id\":17,\"Nome\":\"HYUNDAI\",\"Count\":0,\"IsPrincipal\":false,\"Selected\":false,\"NomeAmigavel\":\"hyundai\"},
        {\"Id\":26,\"Nome\":\"MITSUBISHI\",\"Count\":0,\"IsPrincipal\":false,\"Selected\":false,\"NomeAmigavel\":\"mitsubishi\"},
        {\"Id\":28,\"Nome\":\"PEUGEOT\",\"Count\":0,\"IsPrincipal\":false,\"Selected\":false,\"NomeAmigavel\":\"peugeot\"},
        {\"Id\":30,\"Nome\":\"RENAULT\",\"Count\":0,\"IsPrincipal\":false,\"Selected\":false,\"NomeAmigavel\":\"renault\"},
        {\"Id\":35,\"Nome\":\"TOYOTA\",\"Count\":0,\"IsPrincipal\":false,\"Selected\":false,\"NomeAmigavel\":\"toyota\"},
        {\"Id\":5,\"Nome\":\"VOLKSWAGEN\",\"Count\":0,\"IsPrincipal\":false,\"Selected\":false,\"NomeAmigavel\":\"volkswagen\"},
        {\"Id\":0,\"Nome\":\"\",\"Count\":0,\"IsPrincipal\":false,\"Selected\":false,\"NomeAmigavel\":\"\"},
        {\"Id\":167,\"Nome\":\"ACURA\",\"Count\":0,\"IsPrincipal\":false,\"Selected\":false,\"NomeAmigavel\":\"acura\"},
        {\"Id\":237,\"Nome\":\"ADAMO\",\"Count\":0,\"IsPrincipal\":false,\"Selected\":false,\"NomeAmigavel\":\"adamo\"},
        {\"Id\":223,\"Nome\":\"AGRALE\",\"Count\":0,\"IsPrincipal\":false,\"Selected\":false,\"NomeAmigavel\":\"agrale\"},
        {\"Id\":6,\"Nome\":\"ALFA ROMEO\",\"Count\":0,\"IsPrincipal\":false,\"Selected\":false,\"NomeAmigavel\":\"alfa-romeo\"},
        {\"Id\":232,\"Nome\":\"AMERICAR\",\"Count\":0,\"IsPrincipal\":false,\"Selected\":false,\"NomeAmigavel\":\"americar\"},
        {\"Id\":7,\"Nome\":\"ASIA\",\"Count\":0,\"IsPrincipal\":false,\"Selected\":false,\"NomeAmigavel\":\"asia\"},
        {\"Id\":239,\"Nome\":\"ASTON MARTIN\",\"Count\":0,\"IsPrincipal\":false,\"Selected\":false,\"NomeAmigavel\":\"aston-martin\"},
        {\"Id\":8,\"Nome\":\"AUDI\",\"Count\":0,\"IsPrincipal\":false,\"Selected\":false,\"NomeAmigavel\":\"audi\"}
      ]
    "
  end

  before(:each) do
    stub_request(:post, "http://www.webmotors.com.br/carro/marcas").
      with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'Content-Type'=>'application/x-www-form-urlencoded', 'Host'=>'www.webmotors.com.br', 'User-Agent'=>'Ruby'}).
      to_return(:status => 200, :body => json, :headers => {})
  end

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      expect(assigns(:makes).length).to eq 19
    end
  end
end
