## Create a new s3 bucket

'''md
aws s3 mb s3://checksums-example-nb-2468
'''

## create a file that we will do a checksum on

'''
echo "Hello Mars!" > myfile.txt
'''

## Get a checksum of a file
md5sum myfile.txt
## ad9fa83779fd19527ed739033310bc2f  myfile.txt


## upload our file and look at its etag
aws s3 cp myfile.txt s3://checksums-examples-nb-2468
aws s3api head-object --bucket checksums-example-nb-2468 --key myfile.txt 

## LEts upload a file with a different kind of checksums
cksum -o 3 -b myfile.txt

--checksum-algorithm ="CRC32"
--checksum-algorithm-crc32

d87a80a643074ee091897aed43cdd6af91be496fd108ee8ab8bd4de218b2c62b
