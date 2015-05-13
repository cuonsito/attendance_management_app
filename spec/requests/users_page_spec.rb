require 'spec_helper'

describe "Users Page", type: :request do

  subject { page }

  context "for sign in user" do
    let(:user) { FactoryGirl.create(:user, username: "foo") }
    before do
      9.times { FactoryGirl.create(:user) }
      login user
      visit users_path
    end

    it { should have_content('Users') }
    it { should have_title("Attendance Management App | Users") }
    it { should have_link('Edit profile') }
    it { should have_link('Log out') }
    it { should have_link('株式会社 Cuon') }
    it { should have_link('About') }
    it { should have_link('News') }
    it { should have_selector('#users li', count: 10) }

    context "click Edit profile link" do
      before { click_link "Edit profile" }
      it { should have_title("| Edit profile") }
    end

    context "click Log out link" do
      before { click_link "Log out" }
      it { should have_content('Welcome to the Attendance Management App') }
      it { should have_title("Attendance Management App") }
      it { should_not have_title('| Home') }
    end

    context "click user name link" do
      before { click_link "foo" }
      it { should have_title("| foo") }
    end
  end

  context "for not sign in user" do
    before { visit menu_path }

    it { should have_title("Attendance Management App | Log in") }
    it { should_not have_title('Attendance Management App | Menu') }
  end
end