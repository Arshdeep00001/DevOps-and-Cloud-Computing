# Write a script to report the usage of AWS in your project.
# We can use Boto3 or Python to write this script but we use shell scripts through AWS cli.

# Connect to your EC2 instance using ssh.
# Command:- ssh -i <local-location-till pem file> ubuntu@<public-ip>
# For this project we need to Install and configure AWS cli. To configure AWS cli, we need to goto our AWS account, under our username, we need to click Security Credentials, then we need to create AWS secret id and AWS secret key.
# Use below command :-
# aws configure 
# //Provide access key and secret access key 
# //Provide region name and provide output format as json

# script starts below :-

#!/bin/bash

################
# Author: Arshdeep
# Date: 1st Nov
# Version: v1
# This script will report the AWS resource usage.
# For simplicity, we will not use shell functions but we can make it modular later using shell functions
# We can use cronjobs to automate the task of running this script daily at a particular time
################

# list s3 buckets
echo "Print list of s3 buckets"
aws s3 ls >> resourceTracker

# list EC2 Instances
echo "Print list of ec2 instances"
aws ec2 describe-instances I ja '. Reservations []. Instances.InstanceId' >> resourceTracker
# we use jq to get the instance_id
# jq is json parser
# yq is yaml parser
# [] denotes a list

#list lambda
echo "Print list of lambda functions"
aws lambda list-functions >> resourceTracker

#list IAM users
echo "Print list of IAM Users"
aws iam list-users >> resourceTracker
