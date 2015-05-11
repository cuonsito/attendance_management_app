require 'spec_helper'

describe Member do

  before do
    @project = FactoryGirl.create(:project)
    @user = FactoryGirl.create(:user)
    @member = FactoryGirl.build(:member, project: @project, user: @user)
  end

  subject { @member }

  it { should respond_to(:assain_rate) }
  it { should respond_to(:admin) }
  it { should respond_to(:project_id) }
  it { should respond_to(:user_id) }

  it { should be_valid }

  describe "when member is not unique" do
    before do
      member_with_same_user = @member.dup
      member_with_same_user.save
    end
    it { should_not be_valid }
  end

  describe "with invalid assain_rate"do
    context "when assain_rate < 0" do
      before { @member.assain_rate = -1 }
      it { should_not be_valid }
    end
    context "when assain_rate > 1" do
      before { @member.assain_rate = 2 }
      it { should_not be_valid }
    end
  end
end