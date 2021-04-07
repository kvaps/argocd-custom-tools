# argocd-custom-tools

Custom argocd image with **qbec** and **git-crypt** binaries

This is an attempt to implement transparent PGP encryption support for ArgoCD using git-crypt.

### preambular

The following docker image contains [small wrapper script](git) for git to automatically unlock repository after fetching using git-crypt.

### Installation:

Update your deploy/argocd-repo-server

    kubectl -n argocd set image deploy/argocd-repo-server argocd-repo-server=ghcr.io/kvaps/argocd-custom-tools:v2.0.0

see for more details https://itnext.io/configure-custom-tooling-in-argo-cd-a4948d95626e
