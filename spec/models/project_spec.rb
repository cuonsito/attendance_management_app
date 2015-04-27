require 'spec_helper'

describe Project do

  before { @project = Project.new(name: "project1") }

  subject { @project }

  it { should respond_to(:name) }
end
