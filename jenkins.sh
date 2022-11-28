#!/bin/bash
echo "[server]" > hosts
for i in `aws autoscaling describe-auto-scaling-groups --auto-scaling-group-names jenkinsasg --query 'AutoScalingGroups[*].Instances[*].InstanceId' --output text`
do
aws ec2 describe-instances --instance-ids $i |jq -r '.Reservations[].Instances[].PrivateIpAddress' >> /etc/ansible/hosts
done
