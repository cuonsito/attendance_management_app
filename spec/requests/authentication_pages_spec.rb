require 'spec_helper'

describe "Authentication" do

  subject { page }

  describe "signin page" do
    before { visit user_session_path }

    it { should have_content('ログイン') }
  end
end