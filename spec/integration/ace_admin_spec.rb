require 'spec_helper'

describe "static assets integration" do
  it "provides init_ace_admin.js on the asset pipeline" do
    visit '/assets/init_ace_admin.js'
    page.should have_content('var StaticAsset = {};')
  end

  it "provides inite_ace_admin1.css on the asset pipeline" do
    visit '/assets/inite_ace_admin1.css'
    page.should have_content('.static_asset {')
  end

  it "provides inite_ace_admin2.css on the asset pipeline" do
    visit '/assets/inite_ace_admin2.css'
    page.should have_content('.static_asset {')
  end
end
