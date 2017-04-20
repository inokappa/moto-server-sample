$LOAD_PATH.push('./')
require "spec_helper"
require "my_ec2"
require "pty"

describe 'MyEc2' do
  let(:myec2) { MyEc2.new }
  before(:all) do
    @output, @input = PTY.spawn("moto_server ec2")
    client = Aws::EC2::Client.new(region: 'us-west-2', endpoint: 'http://127.0.0.1:5000', profile: 'mock_profile')
    res = client.run_instances({ image_id: 'ami-20d1c544', min_count: 3, max_count: 3 })
    @instance_ids = res.instances.map { |instance| instance.instance_id }
  end

  it "#ec2" do
    res = myec2.ec2
    expect(res).to be_an_instance_of(Aws::EC2::Client)
  end

  it '#list_ec2_instances' do
    res = myec2.list_ec2_instances
    expect(res).to eq @instance_ids
  end

  it '#main' do
    res = myec2.main
    expect(res).to eq @instance_ids
  end

end
