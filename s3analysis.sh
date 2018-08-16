#!/bin/bash
aws s3 ls | cut -d ' ' -f 3 > bucket_list.tmp
bucket_num=`wc -l < bucket_list.tmp`
   clear
   echo "   ***   S3 BUCKETS SUMMARY    ***"
   echo "__________________________________"
   echo
 while read bucket;
 do
    if [[ $bucket_num -gt 1 ]]; then
   creation_date=`aws s3api list-buckets --output table | grep $bucket | grep "|  $bucket" | cut -c 5,6,7,8,9,10,11,12,13,14 | head -1`
    else
   creation_date=`aws s3 ls | cut -d ' ' -f1`
    fi
   number_of_files=`aws s3 ls $bucket --recursive | grep -v '\/$' | wc -l`
   size_of_files=`aws s3 ls $bucket --recursive --summarize --human-readable | grep "Total Size:" | cut -d " " -f6,7`

   echo "Bucket name: " $bucket
   echo "Creation date: " $creation_date
   echo "Number of files: " $number_of_files
   echo "Total size of files: " $size_of_files
   echo "__________________________________"
   echo
 done < bucket_list.tmp
rm bucket_list.tmp
