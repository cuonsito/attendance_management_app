require 'spec_helper'

describe Member do

  let(:user) { FactoryGirl.create(:user) }
  let(:project) { FactoryGirl.create(:project) }
  let(:admin) { FactoryGirl.create(:admin) }
  
  before do
    @member = Member.new(assain_rate: "0.5")
  end

  it { should respond_to(:user_id) }
  it { should respond_to(:project_id) }
  it { should respond_to(:assain_rate) }
  it { should respond_to(:admin) }
end