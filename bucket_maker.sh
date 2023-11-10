#!/bin/bash

count=0

if [ $# -ne 1 ]; then
	echo "This script needs one bucket name only"
	echo "Usage: ./bucket_maker.sh [BUCKET_NAME]"
	exit 1
fi

gsutil mb gs://$1 2>/dev/null
if [ $? -eq 0 ]; then
	echo "Bucket $1 was created succesully"
	exit 0
else
	echo "failed to create bucket $1"
fi

for i in {1..2}; do
	gsutil mb gs://$1$i 2>/dev/null
	if [ $? -eq 0 ]; then
		echo "Bucket $1$i was sucessfully created"
		exit 0
	else
		echo "failed to create bucket $1$i"
	fi
done

echo "Cannot create bucket"
echo "Finished"
exit 0
