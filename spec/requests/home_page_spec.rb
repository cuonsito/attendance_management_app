require 'spec_helper'

describe "Home Page", type: :request do

  subject { page }

  before { visit root_path }
  it { should have_content('Welcome to the Attendance Management App') }
  it { should have_title("Attendance Management App") }
  it { should_not have_title('| Home') }
  it { should have_link('Sign up') }
  it { should have_link('Log in') }
  it { should have_link('株式会社 Cuon') }
  it { should have_link('About') }
  it { should have_link('News') }

  context "click Login link" do
    before { click_link "Log in" }
    it { should have_title("| Log in") }
  end

  context "click Sign up link" do
    before { click_link "Sign up" }
    it { should have_title("| Sign up") }
  end

  describe "signed in user" do
    let(:user) { FactoryGirl.create(:user) }
    before do
      login user
      visit root_path
    end

    it { should have_title("Attendance Management App | Menu") }
    it { should_not have_content('Welcome to the Attendance Management App') }
  end

end
