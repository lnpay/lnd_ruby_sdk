RSpec.describe do  
  it 'Has a version number' do
    expect(Lightning::VERSION).not_to be nil
  end

  it 'Can use custom macaroon file'
  it 'Returns an error if macaroon file is invalid'
  it 'Can use custom certificate'
  it 'Can skip certificate verification'
  it 'Returns an error if certificate file is invalid'
end
