require 'spec_helper'

describe "Menu Pages" do

  subject { page }

  describe "Menu page" do
    let(:user) { FactoryGirl.create(:user) }
    before do
      login user
      visit menu_path
    end

    it { should have_content('Menu') }
    it { should have_title("Attendance Management App") }
    it { should have_title('| Menu') }
  end
end