require 'spec_helper'

describe FortitudeRails::Configuration do

  subject { Class.new { extend FortitudeRails::Configuration } }

  before do
    subject.set_default_configuration
    subject.app_root = File.join(File.dirname(File.expand_path(__FILE__)), '..', 'dummy')
    subject.theme_components = subject.theme_components.deep_merge(subject.app_pages)
  end

  it 'sets theme components' do
    expect(subject.theme_components['components'].keys).to include('_flag.html.haml')        # from the engine
    expect(subject.theme_components['components'].keys).to include('_app_specific.html.erb') # from the dummy app
    expect(subject.theme_components['components']['nested'].keys).to include('_nested_component.html.erb') # from the dummy app
  end

  it 'allows setting theme intents' do
    expect{subject.theme_intents = ['intent']}.to change{subject.theme_intents}
  end

  it 'allows setting theme components' do
    expect{subject.theme_components = ['navbar']}.to change{subject.theme_components}
  end

  it 'allows setting theme namespace' do
    expect{subject.theme_namespace = 'mynamespace'}.to change{subject.theme_namespace}
  end

  it 'allows configure block' do
    subject.configure do |config|
      config.theme_intents = %w(light dark)
      config.theme_components = %w(navbar)
      config.theme_namespace = 'mynamespace'
    end

    expect(subject.theme_intents).to eq(%w(light dark))
    expect(subject.theme_components).to eq(%w(navbar))
    expect(subject.theme_namespace).to eq('mynamespace')
  end

end