require 'spec_helper'

describe "Static Pages" do

  subject { page }

  shared_examples_for "all static pages" do
    it { should have_content(heading) }
    it { should have_title(full_title(page_title)) }
  end

  describe "Home page" do
    before { visit root_path }

    it { should have_content('Welcome to the Attendance Management App') }
    it { should have_title("Attendance Management App") }
    it { should_not have_title('| Home') }
  end

  it "should have the right links on the layout" do
    visit root_path
    click_link "Attendance Management App"
    expect(page).to have_title(full_title(''))
  end
end

