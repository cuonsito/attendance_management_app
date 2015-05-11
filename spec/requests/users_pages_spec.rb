require 'spec_helper'

describe "List Pages" do

  subject { page }

  describe "List page", type: :request do
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