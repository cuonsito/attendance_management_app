require 'spec_helper'

describe "working_time Page", type: :request do

  subject { page }

  describe "signed in user's page" do
    let(:user) { FactoryGirl.create(:user, username: "foo") }
    let(:user2) { FactoryGirl.create(:user) }
    let(:project1) { FactoryGirl.create(:project, name: "assained project A") }
    let(:project2) { FactoryGirl.create(:project, name: "assained project B") }
    let(:project3) { FactoryGirl.create(:project, name: "Not assained project") }

    before do
      FactoryGirl.create(:member, user: user, project: project1)
      FactoryGirl.create(:member, user: user, project: project2)
      FactoryGirl.create(:working_time, user: user, project: project1)
      login user
      visit user_working_times_path(user)
    end

    it { should have_content('Mypage of foo') }
    it { should have_title('Attendance Management App | foo') }
    it { should have_link('Edit profile') }
    it { should have_link('Log out') }
    it { should have_link('User List') }
    it { should have_link('株式会社 Cuon') }
    it { should have_link('About') }
    it { should have_link('News') }
    it { should have_selector('#working_time_date_1i') }
    it { should have_selector('#working_time_date_2i') }
    it { should have_selector('#working_time_date_3i') }
    it { should have_selector('#working_time_project_id') }
    it { should have_selector('#working_time_time') }
    it { should have_button('Register') }

    describe "project assain list" do
      before { find('#project-assain-list') }
      it { should     have_content('assained project A') }
      it { should     have_content('assained project B') }
      it { should_not have_content('Not assained project') }
    end

    describe "working_time list" do
      before { find('#working-time-list') }
      it { should have_content('2015-04-01') }
      it { should have_content('assained project A') }
      it { should have_content('1.5') }
      it { should have_content('pending') }

      context "click working_time delete link" do
        it "should be able to delete" do
          expect do
            click_link('delete', match: :first)
          end.to change(WorkingTime, :count).by(-1)
        end

        context "when delete first working_time information" do
          before do
            FactoryGirl.create(:working_time, user: user, project: project2, date: "2015-04-02", time: 3)
            visit user_working_times_path(user)
            click_link('delete', match: :first)
          end
          it { should_not have_content('2015-04-01') }
          it { should     have_content('2015-04-02') }
        end
      end
    end

    context "when click Register button" do
      before do
        select '2015',               from: "working_time_date_1i"
        select '4',                  from: "working_time_date_2i"
        select '2',                  from: "working_time_date_3i"
        select 'assained project B', from: "working_time_project_id"
        fill_in 'working_time_time', with: "3"
      end

      context "after input valid information" do
        it "should create a working_time" do
          expect { click_button "Register" }.to change(WorkingTime, :count).by(1)
        end

        context "after saving the working_time" do
          before { click_button "Register" }
          it { should have_content('2015-04-02') }
          it { should have_content('assained project B') }
          it { should have_content('3') }
          it { should have_content('pending') }
        end
      end

      context "after input invalid information" do
        context "input already taken information" do
          before do
            select '2015',               from: "working_time_date_1i"
            select '4',                  from: "working_time_date_2i"
            select '1',                  from: "working_time_date_3i"
            select 'assained project A', from: "working_time_project_id"
            fill_in 'working_time_time', with: "3"
            click_button "Register"
          end
          it { should have_content('Date has already been taken')}      
        end

        context "input nil in time field" do
          before do
            fill_in 'working_time_time', with: ""
            click_button "Register"
          end
          it { should have_content('Time can\'t be blank')}
        end

        context "input a letter in time field" do
          before do
            fill_in 'working_time_time', with: "letter"
            click_button "Register"
          end
          it { should have_content('Time is not a number')}
        end
      end
    end

    context "when over 15 working_time information" do
      before do
        15.times { FactoryGirl.create(:working_time, user: user) }
        visit user_working_times_path(user)
      end

      it { should have_selector('div.pagination') }
    end

    context "click Edit profile link" do
      before { click_link "Edit profile" }
      it { should have_title("| Edit profile") }
    end

    context "click Log out link" do
      before { click_link "Log out" }
      it { should     have_content('Welcome to the Attendance Management App') }
      it { should     have_title("Attendance Management App") }
      it { should_not have_title('| Home') }
    end

    context "click User List link" do
      before { click_link "User List" }
      it { should have_title("| Users") }
    end
  end

  describe "another user's page" do
    let(:admin) { FactoryGirl.create(:user) }
    let(:user) { FactoryGirl.create(:user) }
    let(:project1) { FactoryGirl.create(:project) }
    let(:project2) { FactoryGirl.create(:project) }

    before do
      FactoryGirl.create(:member, user: admin, project: project1, admin: true)
      FactoryGirl.create(:member, user: user, project: project1)
      FactoryGirl.create(:member, user: user, project: project2)
      FactoryGirl.create(:working_time, user: user, project: project1, date: "2015-04-01")
      FactoryGirl.create(:working_time, user: user, project: project1, date: "2015-04-02")
      FactoryGirl.create(:working_time, user: user, project: project2)
      login admin
      visit user_working_times_path(user)
    end

    it { should_not have_selector('#working_time_date_1i') }
    it { should_not have_selector('#working_time_date_2i') }
    it { should_not have_selector('#working_time_date_3i') }
    it { should_not have_selector('#working_time_project_id') }
    it { should_not have_selector('#working_time_time') }
    it { should_not have_button('Register') }
    it { should have_content('pending', count:3) }

    context "admin user" do
      it { should have_link('confirm') }

      context "click confirm button" do
        before { click_link('confirm') }
        it { should have_content('approved', count:2) }
        it { should have_content('pending', count:1) }
      end
    end
  end
end