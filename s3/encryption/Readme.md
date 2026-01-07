## Create a bucket
aws s3 mb s3://encryption-fun-nb-2468

## Create a file with SSE-S3 encryption (default)
echo "Hello World!" > hello.txt
aws s3 cp hello.txt s3://encryption-fun-nb-2468

## Put object with encryption of KMS
aws s3api put-object \
--bucket encryption-fun-nb-2468 \
--key hello.txt \
--body hello.txt \
--server-side-encryption aws:kms \
--ssekms-key-id 575b6aae-38a5-4b6b-a66f-bef4f2e5e037

### Put object with SSE-C
export BASE64_ENCODED_KEY=$(openssl rand -base64 32)

echo $BASE64_ENCODED_KEY

export MD5_VALUE=$(echo -n "$BASE64_ENCODED_KEY" | base64 --decode | openssl md5 -binary | base64)
echo "$MD5_VALUE"

aws s3api put-object \
--bucket encryption-fun-nb-2468 \
--key hello.txt \
--body hello.txt \
--sse-customer-algorithm AES256 \
--sse-customer-key "$BASE64_ENCODED_KEY" \
--sse-customer-key-md5 "$MD5_VALUE"

Result:
{
    "ETag": "\"1b794fd9303f7f857ac59ec2dc641f61\"",
    "ChecksumCRC64NVME": "ULjAmjqOvg8=",
    "ChecksumType": "FULL_OBJECT",
    "SSECustomerAlgorithm": "AES256",
    "SSECustomerKeyMD5": "6Ps4qKcLjzhbaXYv8AqENA=="
}