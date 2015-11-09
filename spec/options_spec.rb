require 'spec_helper'

RSpec.describe Uncomtrade::Options do

  let(:def_options) do
    {
      max: 500,
      fmt: 'json',
      r: 'all',
      freq: 'A',
      ps: 'now',
      px: 'HS',
      p: 0,
      rg: 'all',
      cc: 'TOTAL',
      type: 'C'
    }
  end

  it 'options should have default values' do
    options = Uncomtrade::Options.new
    expect(options.list_options).to eq(def_options)
  end

  it 'options should initialize correctly' do
    options = Uncomtrade::Options.new(p: 528)
    def_options[:p] = 528
    expect(options.list_options).to eq(def_options)
  end

  it 'update method should update the right values' do
    options = Uncomtrade::Options.new
    options.update(max: 100, ps: '2012')
    expect(options.list_options[:max]).to eq(100)
    expect(options.list_options[:ps]).to eq('2012')
  end

  it 'update method should not reset options' do
    options = Uncomtrade::Options.new(max: 200)
    options.update(p: 528)
    expect(options.list_options[:max]).to eq(200)
  end

  it 'new method should use country helper correctly' do
    options = Uncomtrade::Options.new(p: "netherlands", r: "nld")
    expect(options.list_options[:p]).to eq(528)
    expect(options.list_options[:r]).to eq(528)
  end

  it 'update method should use country helper correctly' do
    options = Uncomtrade::Options.new
    options.update(p: "nld")
    expect(options.list_options[:p]).to eq(528)
    options.update(r: "nl")
    expect(options.list_options[:r]).to eq(528)
  end

  it 'reset method should reset options' do
    options = Uncomtrade::Options.new(max: 200)
    options.reset
    expect(options.list_options).to eq(def_options)
  end

  it 'update method should not update :fmt key' do
    options = Uncomtrade::Options.new
    options.update(fmt: 'csv')
    expect(options.list_options[:fmt]).to eq('json')
  end

  it 'creating a new options instance with :fmt specified should not overwrite default value' do
    options = Uncomtrade::Options.new(fmt: 'csv')
    expect(options.list_options[:fmt]).to eq('json')
  end

end