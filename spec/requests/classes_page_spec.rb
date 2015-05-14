require 'spec_helper'

describe "Classes Page", type: :request do

  subject { page }

  let(:user) { FactoryGirl.create(:user, username: "foo") }

  context "for signed in user" do
    before do
      login user
      visit classes_path
    end
    it { should have_title('| Classes')}
    it { should have_content('Classes')}
  end

  context "for not signed in user" do
    before { visit menu_path }

    it { should have_title("Attendance Management App | Log in") }
    it { should_not have_title('Attendance Management App | Menu') }
  end

end