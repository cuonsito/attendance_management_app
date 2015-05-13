require 'spec_helper'

describe "Menu Page" do

  subject { page }

  describe "Menu page" , type: :request do
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