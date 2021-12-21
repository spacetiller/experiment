import boto3
s3 = boto3.resource('s3')

#for bucket in s3.buckets.all():
#    print(bucket.name)

my_bucket = s3.Bucket('abquant-binance-data')
for my_bucket_object in my_bucket.objects.all():
    print(my_bucket_object.key)

s3 = boto3.client('s3')
s3.download_file('abquant-binance-data', 'ps.txt', 'ps1.txt')

