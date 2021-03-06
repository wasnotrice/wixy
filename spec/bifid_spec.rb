require 'wixy/bifid'


describe 'Bifid' do
  let(:bifid) { Wixy::Bifid.new }
  it "encrypts '' to ''" do
    result = bifid.encrypt('')
    expect(result).to eq('')
  end

  # 'Forsaking monastic tradition, twelve jovial friars gave up their
  # vocations.'
  it "encrypts 'F' to 'F'" do
    result = bifid.encrypt('F')
    expect(result).to eq('F')
  end

  it "encrypts 'FO' to 'HD'" do
    result = bifid.encrypt('FO')
    expect(result).to eq('HD')
  end
end
