RSpec.describe Lightning do
  subject(:report) { `rubocop` }
  
  it 'has a version number' do
    expect(Lightning::VERSION).not_to be nil
  end

  it 'has no rubocop offenses' do
    expect(report).to match(/no\ offenses\ detected/)
  end
end
