REGISTRY=registry.ng.bluemix.net
NAME_SPACE=strong
MONGO_BRIDGE=MongoBridge

docker pull registry.ng.bluemix.net/ibmnode:javaee7

docker build -f ./Dockerfile_BlueMix_webapp -t ${REGISTRY}/${NAME_SPACE}/acmeair_webapp .
docker push ${REGISTRY}/${NAME_SPACE}/acmeair_webapp
cf ic run -p 80 --name Jmonolithic_1 -e CCS_BIND_APP=${MONGO_BRIDGE} ${REGISTRY}/${NAME_SPACE}/acmeair_webapp

