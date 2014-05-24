require 'spec_helper'

describe FlickrWrapper do
  FlickrWrapper::Client.api_key = "8440b88a1732512484f853a32428a0fd"

  it "must have the base url set to the Flickr API endpoint" do
    expect(FlickrWrapper::Client.base_uri).to eq("https://api.flickr.com/services/rest")
  end

  it "must have valid api key" do
    expect(FlickrWrapper::Client.api_key).to eq("8440b88a1732512484f853a32428a0fd")
  end

  describe "Get Photos" do
    it "will recieves a list of photos with single tag" do
      responses = FlickrWrapper::Client.get_photos("Hong Kong")
      responses["photos"]["photo"].should_not be_empty
    end

    it "will recieves a list of photos with multiple tag" do
      responses = FlickrWrapper::Client.get_photos("Hong Kong,Singapore")
      responses["photos"]["photo"].should_not be_empty
    end
  end
end
