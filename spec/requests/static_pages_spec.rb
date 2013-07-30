require 'spec_helper'

describe "Static pages" do

  subject { page }

  shared_examples_for "all static pages" do
    it { should have_selector('h1', text: heading) }
    include ApplicationHelper
  end

  describe "Home page" do
    before { visit root_path }
    let(:heading)     { 'Sample App' }

    it_should_behave_like "all static pages"
  end

  describe "Help page" do
    before  { visit help_path }
    let(:heading)     { 'Help' }

    it_should_behave_like "all static pages"
  end

  describe "About page" do
    before  { visit about_path }
    let(:heading)     { 'About Us' }

    it_should_behave_like "all static pages"
  end

  describe "Contact page" do
    before  { visit contact_path }
    let(:heading)     { 'Contact' }

    it_should_behave_like "all static pages"
  end

  it "should have the right links on the layout" do
    visit root_path
    click_link "About"
    include ApplicationHelper
    click_link "Help"
    include ApplicationHelper
    click_link "Contact"
    include ApplicationHelper
    click_link "Home"
    click_link "Sign up now!"
    include ApplicationHelper
    click_link "sample app"
    include ApplicationHelper
  end
end