require 'spec_helper'

RSpec.describe Uncomtrade::Options do

  before(:each) do
    @options = {
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
    expect(options.list_options).to eq(@options)
  end

  it 'options should initialize correctly' do
    options = Uncomtrade::Options.new(p: 528)
    @options[:p] = 528
    expect(options.list_options).to eq(@options)
  end

  it 'update method should update the right values' do
    options = Uncomtrade::Options.new
    options.update(max: 100, ps: '2012')
    expect(options.list_options[:max]).to eq(100)
    expect(options.list_options[:ps]).to eq('2012')
  end

  it 'update method should not reset options' do
    options = Uncomtrade::Options.new(max: 200)
    options.update(p: 44)
    expect(options.list_options[:max]).to eq(200)
  end

  it 'reset method should reset options' do
    options = Uncomtrade::Options.new(max: 200)
    options.reset
    expect(options.list_options).to eq(@options)
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