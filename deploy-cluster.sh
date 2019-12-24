#! /bin/bash
#https://rancher.com/blog/2019/deploying-redis-cluster/

#The next step is to form a Redis Cluster. 
#To do this, we run the following command and type yes to accept the configuration. 
# The first three nodes become masters, and the last three become slaves.
kubectl exec -it redis-cluster-0 -- redis-cli --cluster create --cluster-replicas 1 $(kubectl get pods -l app=redis-cluster -o jsonpath='{range.items[*]}{.status.podIP}:6379 ')
