# downscale daemonset
kubectl -n kube-system patch daemonset svclb-nginx-ingress-nginx-controller-f26d7a00 -p '{"spec": {"template": {"spec": {"nodeSelector": {"non-existing": "true"}}}}}'

# github token for flux
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

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
