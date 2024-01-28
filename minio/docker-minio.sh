#!/bin/bash
docker run -d \
  -p 20090:9000 \
  -p 20091:9001 \
  -v /Users/vtg/minio/disk-1:/mnt/disk1 \
  -v /Users/vtg/minio/disk-2:/mnt/disk2 \
  -v /Users/vtg/minio/disk-3:/mnt/disk3 \
  -v /Users/vtg/minio/disk-4:/mnt/disk4 \
  --name minio \
  --hostname minio \
  quay.io/minio/minio server http://minio/mnt/disk{1...4}/minio --address ":9000" --console-address ":9001"
