#define parameters which are passed in.
#define the template.
cat  << EOF
{
    "Comment": "Creating alias",
    "Changes": [{
               "Action": "UPSERT",
               "ResourceRecordSet": {
                           "Name": "elb.test.com",
                           "Type": "A",
                           "AliasTarget":{
                                   "HostedZoneId": "ZHURV8PSTC4K8",
                                   "DNSName": "$1",
                                   "EvaluateTargetHealth": false
                             }}
                         }]
}
EOF