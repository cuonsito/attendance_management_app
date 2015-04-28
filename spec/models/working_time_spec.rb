require 'spec_helper'

describe WorkingTime do

  before do
    @project = FactoryGirl.create(:project)
    @user = FactoryGirl.create(:user)
    @working_time = FactoryGirl.build(:working_time, project: @project, user: @user)
  end

  subject { @working_time }

  it { should respond_to(:time) }
  it { should respond_to(:date) }
  it { should respond_to(:approval) }
  it { should respond_to(:user_id) }
  it { should respond_to(:project_id)}

  it { should be_valid }

  describe "when working_time is not unique" do
    before do
      working_time_with_same_user = @working_time.dup
      working_time_with_same_user.save
    end
    it { should_not be_valid }
  end

  describe "with invalid time"do
    context "when time < 0" do
      before { @working_time.time = -1 }
      it { should_not be_valid }
    end
    context "when time > 8" do
      before { @working_time.time = 10 }
      it { should_not be_valid }
    end
  end
end