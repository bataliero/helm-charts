#!/bin/bash
# checkov --framework helm -d charts/test123/ --compact --quiet  --output-file-path report -o sarif 
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

kube-linter  
kube-score   
kubeaudit    kubeconform  kubectl      
kubesec      kubeval

