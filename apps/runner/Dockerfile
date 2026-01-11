FROM ghcr.io/actions/actions-runner:latest

USER root

ENV HELMFILE_VERSION=1.2.3
ENV HELM_SECRETS_VERSION=4.7.4
ENV SOPS_VERSION=3.11.0

# install basic tools
RUN : \
    && apt-get update \
    && apt-get install -y \
        jq \
        curl \
        tar \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# install helm 4
RUN : \
    && curl -fsSL -o /tmp/get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-4 \
    && chmod 700 /tmp/get_helm.sh \
    && /tmp/get_helm.sh

# install helmfiles and plugins
RUN : \
    && curl -L https://github.com/helmfile/helmfile/releases/download/v${HELMFILE_VERSION}/helmfile_${HELMFILE_VERSION}_linux_amd64.tar.gz | tar xz \
    && mv helmfile /usr/local/bin/ \
    && helm plugin install https://github.com/databus23/helm-diff --verify=false || true \
    && helm plugin install https://github.com/jkroepke/helm-secrets/releases/download/v${HELM_SECRETS_VERSION}/secrets-${HELM_SECRETS_VERSION}.tgz --verify=false || true \
    && helm plugin install https://github.com/jkroepke/helm-secrets/releases/download/v${HELM_SECRETS_VERSION}/secrets-getter-${HELM_SECRETS_VERSION}.tgz --verify=false || true \
    && helm plugin install https://github.com/jkroepke/helm-secrets/releases/download/v${HELM_SECRETS_VERSION}/secrets-post-renderer-${HELM_SECRETS_VERSION}.tgz --verify=false || true \
    && curl -L https://github.com/getsops/sops/releases/download/v${SOPS_VERSION}/sops-v${SOPS_VERSION}.linux.amd64 -o sops \
    && chmod +x sops \
    && mv sops /usr/local/bin/

USER runner
