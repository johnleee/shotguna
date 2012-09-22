require 'spec_helper'

describe Activity do
  let(:user) { FactoryGirl.create(:user) }
  before { @activity = user.activities.build(name: "Lake Merced Loop", distance: 6, time: 3600,
                                             date: Time.now, activity_type_id: 1) }

  subject { @activity }

  it { should respond_to(:name) }
  it { should respond_to(:distance) }
  it { should respond_to(:time) }
  it { should respond_to(:date) }
  it { should respond_to(:activity_type_id) }
  it { should respond_to(:user_id) }
  its(:user) { should == user }

  it { should be_valid }

  describe "when user_id is not present" do
    before { @activity.user_id = nil }
    it { should_not be_valid }
  end

  describe "accessible attributes" do
    it "should not allow access to user_id" do
      expect do
        Activity.new(user_id: user.id)
      end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end
  end

  describe "with blank name" do
    before { @activity.name = " " }
    it { should_not be_valid }
  end

  describe "with name that is too long" do
    before { @activity.name = "a" * 51 }
    it { should_not be_valid }
  end

  describe "with blank distance" do
    before { @activity.distance = " " }
    it { should_not be_valid }
  end

  describe "with distance that is too long" do
    before { @activity.distance = 1234 }
    it { should_not be_valid }
  end
end
