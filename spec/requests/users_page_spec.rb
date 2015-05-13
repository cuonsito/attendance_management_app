require 'spec_helper'

describe "Users Page" do

  subject { page }

  describe "Users page", type: :request do
    let(:user) { FactoryGirl.create(:user) }
    before do
      login user
      visit users_path
    end

    it { should have_content('社員一覧') }
    it { should have_title("Attendance Management App") }
    it { should have_title('| List') }
  end
  
end