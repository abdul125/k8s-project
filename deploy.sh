time k3d cluster create abdul -v /var/run/docker.sock:/var/run/docker.sock --agents 3 -p 30000-32767:30000-32767@server[0] -p 80:80@loadbalancer
kubectl create namespace test
git clone https://github.com/abdul125/k8s-pods

#deploying main-site
kubectl apply -f k8s-pods/project-assessment-site/deploy.yaml -n test
kubectl apply -f k8s-pods/project-assessment-site/service.yaml -n test

#deploying office
kubectl apply -f k8s-pods/office-service/deploy.yaml -n test
kubectl apply -f k8s-pods/office-service/service.yaml -n test

#deploying  department
kubectl apply -f k8s-pods/department-service/deploy.yaml -n test
kubectl apply -f k8s-pods/department-service/service.yaml -n test

kubectl get all --all-namespaces