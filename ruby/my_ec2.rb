require 'aws-sdk'

class MyEc2

  def ec2
     @ec2 ||= Aws::EC2::Client.new(profile: 'mock_profile',
                                   region: 'us-west-2',
                                   endpoint: 'http://127.0.0.1:5000')
  end
  
  def list_ec2_instances
    instance_ids = []
    ec2.describe_instances.reservations.each do |res|
      res.instances.each do |instance|
        instance_ids << instance.instance_id
      end
    end
    instance_ids
  end
  
  def main
    list_ec2_instances.each do |instance| 
      instance
    end
  end
end

# myec2 = MyEc2.new
# p myec2.main
