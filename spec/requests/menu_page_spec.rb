require 'spec_helper'

describe "Menu Page", type: :request do

  subject { page }

  context "for signed in user" do
    let(:user) { FactoryGirl.create(:user) }
    before do
      login user
      visit menu_path
    end

    it { should have_content('Menu') }
    it { should have_title("Attendance Management App | Menu") }
    it { should have_link('Edit profile') }
    it { should have_link('Log out') }
    it { should have_link('株式会社 Cuon') }
    it { should have_link('About') }
    it { should have_link('News') }

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

    context "click 社員一覧 link" do
      before { click_link "社員一覧" }
      it { should have_title("| Users") }
    end

    context "click プロジェクト一覧 profile link" do
      before { click_link "プロジェクト一覧" }
      it { should have_title("| Projects") }
    end

    context "click クラス一覧 link" do
      before { click_link "クラス一覧" }
      it { should have_title("| Classes") }
    end
  end

  context "for not signed in user" do
    before { visit menu_path }

    it { should have_title("Attendance Management App | Log in") }
    it { should_not have_title('Attendance Management App | Menu') }
  end
end