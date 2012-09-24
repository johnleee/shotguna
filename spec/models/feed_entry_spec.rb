require 'spec_helper'

describe FeedEntry do
  before do
    @feed_entry = FeedEntry.new(name: "Ask the Sports Doc", summary: "My question is ?",
        url: "http://www.google.com", published_at: Time.now, guid: "http://sportsdoc.runnersworld.com/2012/09/howasthma.html")
  end

  subject { @feed_entry }

  it { should respond_to(:name) }
  it { should respond_to(:summary) }
  it { should respond_to(:url) }
  it { should respond_to(:published_at) }
  it { should respond_to(:guid) }

  it { should be_valid }

end
