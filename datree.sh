#!/bin/bash
# checkov --framework helm -d charts/test123/ --compact --quiet  --output-file-path report -o sarif 
kubectl get secrets/sh.helm.release.v1.mychart.v1 -o json  \
    | jq -r .data.release  \
    | base64 -d  \
    | base64 -d  \
    | gunzip -c   \
    | jq -r '.chart.templates[].data' \
    | base64 -d
checkov --framework helm -d charts/test123/   --output-file-path report -o sarif 
sarif html report --output index.html
helm template charts/test123  | docker run  --rm -i -v  $(pwd):/project zegl/kube-score:latest score -
terrascan scan 
exit 0 
exit 0
docker run --rm -i -v$(pwd):$(pwd) deck15/kubeval-tools:latest /bin/bash -c "helm template  /home/fukjo/Documents/kube8/helm-charts/charts/test123 | kubesec scan -"
exit 0
helm  datree test  --ignore-missing-schemas --verbose charts/test123/
docker run --rm -it -v(pwd):(pwd) deck15/kubeval-tools:latest kube-linter lint --add-all-built-in (pwd)

# kube-linter  
# kube-score   
# kubeaudit    
# kubeconform  
# kubesec      

