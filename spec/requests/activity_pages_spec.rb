require 'spec_helper'

describe "Activity pages" do

  subject { page }

  let(:user) { FactoryGirl.create(:user) }
  before { sign_in user }

  describe "activity creation" do
    before { visit activities_path }

    describe "with invalid information" do

      it "should not create a activity" do
        expect { click_button "Post" }.not_to change(Activity, :count)
      end

      describe "error messages" do
        before { click_button "Post" }
        it { should have_content('error') }
      end
    end

    describe "with valid information" do

      before { fill_in 'activity_name', with: "Ocean Beach Run" }
      before { fill_in 'activity_time', with: "3200" }
      before { fill_in 'activity_distance', with: "5" }
      it "should create a activity" do
        expect { click_button "Post" }.to change(Activity, :count).by(1)
      end
    end
  end
end