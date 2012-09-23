require 'spec_helper'

describe Address do
  let(:user) { FactoryGirl.create(:user) }
  before { @activity = user.activities.build(name: "Lake Merced Loop", distance: 6, time: 36,
      date: Time.now, activity_type_id: 1, address_attributes: {city: "SF", state:"CA", zip:"94132"} ) }

  subject { @activity.address }

  it { should respond_to(:name) }
  it { should respond_to(:line1) }
  it { should respond_to(:line2) }
  it { should respond_to(:city) }
  it { should respond_to(:state) }
  it { should respond_to(:addressable_id) }

  it { should be_valid }

  describe "accessible attributes" do
    it "should not allow access to addressable_id" do
      expect do
        Address.new(addressable_id: user.id)
      end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end

    it "should not allow access to addressable_type" do
      expect do
        Address.new(addressable_type: user.id)
      end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end
  end

  describe "with blank city" do
    before { @activity.address.city = " " }
    it { should_not be_valid }
  end

  describe "with city that is too long" do
    before { @activity.address.city = "a" * 51 }
    it { should_not be_valid }
  end

  describe "with blank state" do
    before { @activity.address.state = " " }
    it { should_not be_valid }
  end

  describe "with state that is too long" do
    before { @activity.address.state = "California" }
    it { should_not be_valid }
  end

  describe "with blank zip" do
    before { @activity.address.zip = " " }
    it { should_not be_valid }
  end

  describe "with zip that is too long" do
    before { @activity.address.zip = "1" * 11 }
    it { should_not be_valid }
  end
end
