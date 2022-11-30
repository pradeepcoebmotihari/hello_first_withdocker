#!/bin/bash
set -e
echo "[server]" > /etc/ansible/hosts
for i in `aws autoscaling describe-auto-scaling-groups --auto-scaling-group-names jenkinsasg --query 'AutoScalingGroups[*].Instances[*].InstanceId' --output text` 
do 
#aws autoscaling detach-instances --instance-ids $i --auto-scaling-group-name jenkinsasg --should-decrement-desired-capacity
aws ec2 describe-instances --instance-ids $i |jq -r '.Reservations[].Instances[].PrivateIpAddress' >> /etc/ansible/hosts
ansible-playbook -e 'host_key_chaking=False' ansible.yml --private-key=/home/id_rsa -u ansible 
sleep 330
#aws autoscaling attach-instances --instance-ids $i --auto-scaling-group-name jenkinsasg
done

