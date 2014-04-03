require 'spec_helper'

describe "static assets integration" do
  it "provides init_ace_admin.js on the asset pipeline" do
    visit "/assets/ace_admin/init.js"
    page.should have_content('jQuery v2.0.3')
  end

  it "provides inite_ace_admin1.css on the asset pipeline" do
    visit '/assets/ace_admin/init1.css'
    page.should have_content('.col-lg-1')
  end

  it "provides inite_ace_admin2.css on the asset pipeline" do
    visit "/assets/ace_admin/init2.css"
    page.should have_content('.widget-box')
  end

end
