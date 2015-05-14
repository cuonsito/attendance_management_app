require 'spec_helper'

describe "Projects Page", type: :request do

  subject { page }

  let(:user) { FactoryGirl.create(:user, username: "foo") }

  context "for signed in user" do
    before do
      login user
      visit projects_path
    end
    it { should have_title('| Projects')}
    it { should have_content('Projects')}
  end

  context "for not signed in user" do
    before { visit menu_path }

    it { should have_title("Attendance Management App | Log in") }
    it { should_not have_title('Attendance Management App | Menu') }
  end

end