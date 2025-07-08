
# CD Strategy — ObsidianWall

## Overview

While CI is in place, CD is still pending full implementation. This document will guide the automation of deployment workflows for:

- Modules (auto-apply on approve)
- Environments (plan + approval gates)
- Infrastructure state promotion (dev → staging → prod)

## Target Tools

- Terraform Cloud or GitHub OIDC to cloud
- Optional GitHub Deployments API
- Automated rollout via `obsi-cli`

## TODOs

- [ ] Create `.github/workflows/module-cd-template.yml`
- [ ] Define promotion gates (e.g., manual approval)
- [ ] Support rollback triggers

Coming soon in Phase 3.
