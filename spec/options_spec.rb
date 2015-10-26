require 'spec_helper'

RSpec.describe Uncomtrade::Query do

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
    query = Uncomtrade::Query.new
    expect(query.options).to eq(@options)
  end

  it 'options should initialize correctly' do
    query = Uncomtrade::Query.new(p: 22)
    @options[:p] = 22
    expect(query.options).to eq(@options)
  end

  it 'update method should update the right values' do
    query = Uncomtrade::Query.new
    query.update(max: 100, ps: '2012')
    expect(query.options[:max]).to eq(100)
    expect(query.options[:ps]).to eq('2012')
  end

  it 'update method should not reset options' do
    query = Uncomtrade::Query.new(max: 200)
    query.update(p: 44)
    expect(query.options[:max]).to eq(200)
  end

  it 'reset method should reset options' do
    query = Uncomtrade::Query.new(max: 200)
    query.reset
    expect(query.options).to eq(@options)
  end

end