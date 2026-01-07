# Local-server

Self hosted server using Debian 10 Linux distro and k3s for managing Kubernetes.

## Infrastructure

1. `middleware/`

Contains helmfiles and values for used charts in deployment.

| Release name          | Helm chart                      | Version   |
| :-------------------- | :------------------------------ | --------: |
| nginx                 | ingress-nginx                   | `4.14.x`  |
| grafana               | kube-prometheus-stack           | `80.10.x` |
| cert-manager          | cert-manager                    | `1.19.x`  |
| arc-runner-controller | gha-runner-scale-set-controller | `0.13.x`  |
| arc-runner-set        | gha-runner-scale-set            | `0.13.x`  |

2. `apps/`

Folder for Docker image creation and pushing to local registry

3. `src/`

Application code
