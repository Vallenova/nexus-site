require 'spec_helper'

describe EstructuraPaginasController do

  describe "GET 'Inicio'" do
    it "returns http success" do
      get 'Inicio'
      response.should be_success
    end
  end

end
