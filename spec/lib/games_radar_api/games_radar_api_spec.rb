require_relative '../../../spec/spec_helper'

describe GamesRadarApi do
  it "should have a version" do
    GamesRadarApi::VERSION.wont_be_nil
  end
end