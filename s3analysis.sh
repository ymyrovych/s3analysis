#!/bin/bash
aws s3 ls | cut -d ' ' -f 3 > bucket_list.tmp
   clear
   echo "   ***   S3 BUCKETS SUMMARY    ***"
   echo "__________________________________"
   echo
while read bucket;
 do
   echo "Bucket name: " $bucket
   echo "Creation date: " `aws s3api list-buckets --output table | grep $bucket | grep "|  $bucket" | cut -c 5,6,7,8,9,10,11,12,13,14 | head -1`
   echo "Number of files: " `aws s3 ls $bucket --recursive | grep -v '\/$' | wc -l`
   echo "Total size of files: " `aws s3 ls $bucket --recursive --summarize --human-readable | grep "Total Size:" | cut -d " " -f6,7`
   echo "__________________________________"
   echo
 done < bucket_list.tmp
rm bucket_list.tmp
