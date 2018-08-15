# S3 Analysis Tool

### Usage instructions for Linux and OSX:

1. Make sure that latest version of AWS cli is installed and configured correctly.

   Use AWS access key ID of user, which has permissions to access needed S3 buckets.

2. Clone repo and change directory to `s3analysis`.

    `git clone https://github.com/ymyrovych/s3analysis && cd s3analysis/`
    
3. Run s3analysis.sh tool.

   `./s3analysis.sh`


### Expected output is following set of chunks:
```
   ***   S3 BUCKETS SUMMARY    ***
__________________________________

Bucket name:  <name>
Creation date:  <yyyy-mm-dd>
Number of files:  <n>
Total size of files:  <size> <Bytes\KiB\MiB\GiB\TiB>
__________________________________

...
```

### KNOWN ISSUES:
1. Issue: Following errors in output:

```
An error occurred (InvalidRequest) when calling the ListObjects operation: You are attempting to operate on a bucket in a region that requires Signature Version 4.
You can fix this issue by explicitly providing the correct region location using the --region argument, the AWS_DEFAULT_REGION environment variable,
or the region variable in the AWS CLI configuration file.  You can get the bucket's location by running "aws s3api get-bucket-location --bucket BUCKET".
```

Resolution: Upgrade your awscli to latest version.

### NOTES:

Counters of size and quantity of files in S3 buckets are using `--recursive` argument and may take a lot of time for execution if bucket contains a lot of files (>100k) and subdirectories. To avoid waiting it is better to forward output to some text file and run in background.

Tool is verified on Ubuntu 16.04 with awscli 1.15.78 and macOS 10.12 with awscli 1.11.84.
