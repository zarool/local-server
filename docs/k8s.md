# downscale daemonset
kubectl -n kube-system patch daemonset svclb-nginx-ingress-nginx-controller-f26d7a00 -p '{"spec": {"template": {"spec": {"nodeSelector": {"non-existing": "true"}}}}}'
