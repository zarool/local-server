# downscale daemonset
kubectl -n kube-system patch daemonset svclb-nginx-ingress-nginx-controller-f26d7a00 -p '{"spec": {"template": {"spec": {"nodeSelector": {"non-existing": "true"}}}}}'

# github token for flux

# flux command
flux bootstrap github \
  --owner=zarool \
  --repository=local-server \
  --branch=main \
  --path=middleware \
  --personal \
  --token-auth \
  --namespace gitops

kubectl create secret generic sops-age --namespace=gitops --from-file=age.agekey=/home/wsl/.sops/keys.txt
