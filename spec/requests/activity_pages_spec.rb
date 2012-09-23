require 'spec_helper'

describe "Activity pages" do

  subject { page }

  let(:user) { FactoryGirl.create(:user) }
  before { sign_in user }

  describe "activity creation" do
    before { visit activities_path }

    describe "with invalid information" do

      it "should not create a activity" do
        expect { click_button "Submit" }.not_to change(Activity, :count)
      end

      describe "error messages" do
        before { click_button "Submit" }
        it { should have_content('error') }
      end

      describe "time is too long" do
        before { fill_in 'activity_name', with: "Ocean Beach Run" }
        before { fill_in 'activity_time', with: "2035" }
        before { fill_in 'activity_distance', with: "5" }
        before { fill_in 'activity_address_attributes_city', with: "San Francisco" }
        before { fill_in 'activity_address_attributes_state', with: "CA" }
        before { fill_in 'activity_address_attributes_zip', with: "94132" }
        it "should not create a activity" do
          expect { click_button "Submit" }.not_to change(Activity, :count)
        end
      end

      describe "time is too long" do
        before { fill_in 'activity_name', with: "Ocean Beach Run" }
        before { fill_in 'activity_time', with: "35" }
        before { fill_in 'activity_distance', with: "1235" }
        before { fill_in 'activity_address_attributes_city', with: "San Francisco" }
        before { fill_in 'activity_address_attributes_state', with: "CA" }
        before { fill_in 'activity_address_attributes_zip', with: "94132" }
        it "should not create a activity" do
          expect { click_button "Submit" }.not_to change(Activity, :count)
        end
      end

      describe "state is too long" do
        before { fill_in 'activity_name', with: "Ocean Beach Run" }
        before { fill_in 'activity_time', with: "35" }
        before { fill_in 'activity_distance', with: "5" }
        before { fill_in 'activity_address_attributes_city', with: "San Francisco" }
        before { fill_in 'activity_address_attributes_state', with: "California" }
        before { fill_in 'activity_address_attributes_zip', with: "94132" }
        it "should not create a activity" do
          expect { click_button "Submit" }.not_to change(Activity, :count)
        end
      end
    end

    describe "with valid information" do

      before { fill_in 'activity_name', with: "Ocean Beach Run" }
      before { fill_in 'activity_time', with: "35" }
      before { fill_in 'activity_distance', with: "5" }
      before { fill_in 'activity_address_attributes_city', with: "San Francisco" }
      before { fill_in 'activity_address_attributes_state', with: "CA" }
      before { fill_in 'activity_address_attributes_zip', with: "94132" }
      it "should create a activity" do
        expect { click_button "Submit" }.to change(Activity, :count).by(1)
      end
    end
  end
end