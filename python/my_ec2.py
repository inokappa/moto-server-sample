import boto3

ec2 = boto3.resource('ec2', region_name='us-west-1', endpoint_url='http://localhost:5000')
instance = ec2.create_instances(ImageId='ami-20d1c544', MinCount=1, MaxCount=1)
for instance in ec2.instances.all():
   print instance
