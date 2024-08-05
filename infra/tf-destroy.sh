#!/bin/bash



echo "####################"
echo "Destroying Prometheus "
echo "####################"

terraform -chdir=./modules/addons/prometheus destroy --auto-approve -var-file=values.tfvars || true


echo "#################"
echo "Destroying Kafka "
echo "#################"

terraform -chdir=./modules/kafka destroy --auto-approve || true


echo "#################"
echo "Destroying ISTIO "
echo "#################"

terraform -chdir=./modules/service_mesh destroy --auto-approve || true



echo "#####################"
echo "Destroying EksCluster "
echo "#####################"

terraform destroy --auto-approve -var-file=values.tfvars || true
