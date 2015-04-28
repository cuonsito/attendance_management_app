require 'spec_helper'

describe WorkingTime do

  let(:user) { FactoryGirl.create(:user) }
  let(:project) { FactoryGirl.create(:project, user: user) }

  before do
    @working_time = WorkingTime.new(time: "1.5", date: "2015/04/01", approval: "false")
  end

  subject { @working_time }

  it { should respond_to(:time) }
  it { should respond_to(:date) }
  it { should respond_to(:approval) }
  it { should respond_to(:user_id) }
  it { should respond_to(:project_id)}
end