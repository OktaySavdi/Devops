namespace=$1
deploymentName=$2
servicename=$3
registry=$4
image=$5
CI_PIPELINE_ID=$6
port=$7

//create deployment and sevices
if [ "$(kubectl get namespace | grep $namespace | wc -l)"  -lt 1 ]; then
        kubectl create namespace $namespace
fi
if [ "$(kubectl get deployments.apps $deploymentName | wc -l)" -gt 0 ]; then
        kubectl delete deployments $deploymentName -n $namespace --grace-period=0 --force
        kubectl delete svc $servicename -n $namespace --grace-period=0 --force
        kubectl run $deploymentName --image=$registry/$image:$CI_PIPELINE_ID --labels="app=java,module=liberty" --port=$port -n $namespace
        kubectl expose deployment $deploymentName --port=$port --target-port=$port --name=$servicename --protocol='TCP' -n $namespace
else
        kubectl run $deploymentName --image=$registry/$image:$CI_PIPELINE_ID --labels="app=java,module=liberty" --port=$port -n $namespace
        kubectl expose deployment $deploymentName --port=$port --target-port=$port --name=$servicename --protocol='TCP' -n $namespace
fi