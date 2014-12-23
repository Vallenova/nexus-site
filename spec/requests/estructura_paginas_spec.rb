require 'rails_helper'

RSpec.describe "EstructuraPaginas", :type => :request do
  describe "GET /estructura_paginas" do
    it "EstructuraPaginas" do
      get root_path
      expect(response).to have_http_status(200)
    end
  end

  describe "index" do

    it "Deberia tener el contenido 'nexus'" do
      visit root_path
      expect(page).to have_content('nexus')
    end
  end

  describe "acerca" do

    it "Deberia tener el contenido 'ACERCA'" do
      visit acerca_path
      expect(page).to have_content('ACERCA')
    end
  end
end
