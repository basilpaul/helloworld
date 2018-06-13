require 'spec_helper'

describe 'hello_chef::default' do
  # Serverspec examples can be found at
  # http://serverspec.org/resource_types.html
  describe port(5000) do
	it { should be_listening }
  end

  describe port(80) do
	it { should be_listening }
  end
end