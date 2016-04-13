require 'rails_helper'

RSpec.describe ModelsController, type: :controller do
  let!(:webmotors_make_id) { 167 }
  let!(:make) { create(:make, webmotors_id: webmotors_make_id)}
  let!(:json) do
    "
      [
        {\"Id\":2000,\"Nome\":\"INTEGRA\",\"Count\":0,\"NomeAmigavel\":\"integra\"},
        {\"Id\":2001,\"Nome\":\"LEGEND\",\"Count\":0,\"NomeAmigavel\":\"legend\"},
        {\"Id\":3092,\"Nome\":\"MDX\",\"Count\":0,\"NomeAmigavel\":\"mdx\"},
        {\"Id\":2002,\"Nome\":\"NSX\",\"Count\":0,\"NomeAmigavel\":\"nsx\"},
        {\"Id\":3035,\"Nome\":\"RDX\",\"Count\":0,\"NomeAmigavel\":\"rdx\"},
        {\"Id\":3106,\"Nome\":\"RL\",\"Count\":0,\"NomeAmigavel\":\"rl\"},
        {\"Id\":3523,\"Nome\":\"RMD\",\"Count\":0,\"NomeAmigavel\":\"rmd\"},
        {\"Id\":3107,\"Nome\":\"TL\",\"Count\":0,\"NomeAmigavel\":\"tl\"},
        {\"Id\":3108,\"Nome\":\"TSX\",\"Count\":0,\"NomeAmigavel\":\"tsx\"},
        {\"Id\":3099,\"Nome\":\"ZDX\",\"Count\":0,\"NomeAmigavel\":\"zdx\"}
      ]
    "
  end

  before(:each) do
    stub_request(:post, "http://www.webmotors.com.br/carro/modelos").
      with(:body => {"marca"=>"167"}, :headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'Content-Type'=>'application/x-www-form-urlencoded', 'Host'=>'www.webmotors.com.br', 'User-Agent'=>'Ruby'}).
      to_return(:status => 200, :body => json, :headers => {})
  end

  describe "GET 'index'" do
    it "returns http success" do
      get 'index', { webmotors_make_id: 167}
      expect(assigns(:models).length).to eq 10
    end
  end
end
