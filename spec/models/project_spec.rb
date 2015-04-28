require 'spec_helper'

describe Project do

  let(:project) { FactoryGirl.create(:project) }

  it { should respond_to(:name) }
end
