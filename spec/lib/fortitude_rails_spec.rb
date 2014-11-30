require 'spec_helper'

describe FortitudeRails do
  subject { FortitudeRails }

  it 'has theme intents' do
    expect(subject.theme_intents).to be_an(Array)
  end

  it 'has theme components' do
    expect(subject.theme_components).to be_an(Array)
  end

end