# build images 
docker build -t dharmendra10723/multi-client:latest -t dharmendra10723/multi-client:$GIT_SHA -f ./client/Dockerfile ./client
docker build -t dharmendra10723/multi-worker -t dharmendra10723/multi-worker:$GIT_SHA -f ./worker/Dockerfile ./worker
docker build -t dharmendra10723/multi-server -t dharmendra10723/multi-server:$GIT_SHA -f ./server/Dockerfile ./server

# push images to docker hub
docker push dharmendra10723/multi-client:latest
docker push dharmendra10723/multi-worker:latest
docker push dharmendra10723/multi-server:latest
docker push dharmendra10723/multi-client:$GIT_SHA
docker push dharmendra10723/multi-worker:$GIT_SHA
docker push dharmendra10723/multi-server:$GIT_SHA

# apply k8s config to kubectl
kubectl apply -f ./k8s

# set latest images
kubectl set image deployments/client-deployment client=dharmendra10723/multi-client:$GIT_SHA
kubectl set image deployments/server-deployment server=dharmendra10723/multi-server:$GIT_SHA
kubectl set image deployments/worker-deployment worker=dharmendra10723/multi-worker:$GIT_SHA