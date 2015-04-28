require 'spec_helper'

describe Project do
  
  before do
    @project = FactoryGirl.build(:project)
    @user = FactoryGirl.build(:user)
    @member = FactoryGirl.build(:member, project: @project, user: @user)
  end

  subject { @project }

  it { should respond_to(:name) }
  it { should respond_to(:members) }
  it { should respond_to(:users) }

  it { should be_valid }

  describe "when project name is already taken" do
    before do
      project_with_same_name = @project.dup
      project_with_same_name.save
    end
    it { should_not be_valid }
  end
end
