# Sonatype Lifecycle GitHub Action

Run a Sonatype Lifecycle policy evaluation as part of your GitHub Actions workflow.

- [Description](#description)
- [Inputs](#inputs)
- [Runs](#runs)
- [Example Usage](#example-usage)
  - [Maven Build](#maven-build)
- [Migration from v1](#migration-from-v1)
- [The Fine Print](#the-fine-print)

<!-- action-docs-header source="action.yml" -->

<!-- action-docs-header source="action.yml" -->

<!-- action-docs-description source="action.yml" -->
## Description

Run a Sonatype Lifecycle policy evaluation as part of your GitHub Actions workflow.
<!-- action-docs-description source="action.yml" -->

<!-- action-docs-inputs source="action.yml" -->
## Inputs

| name | description | required | default |
| --- | --- | --- | --- |
| `serverUrl` | <p>Sonatype Lifecycle Server URL</p> | `true` | `""` |
| `username` | <p>Username to connect to Sonatype Lifecycle Server for policy evaluation</p> | `true` | `""` |
| `password` | <p>Password to connect to Sonatype Lifecycle Server for policy evaluation</p> | `true` | `""` |
| `applicationId` | <p>Determines the policy elements (policies, labels, and license threat groups) to associate with this build, and is managed via the Sonatype Lifecycle Server.</p> | `true` | `""` |
| `stage` | <p>Controls the stage the policy evaluation will be run against on the Sonatype Lifecycle Server.</p> | `true` | `Build` |
| `target` | <p>This is the path to a specific application archive file, a directory containing such archives or the ID of a Docker image. For archives, a number of formats are supported, including jar, war, ear, tar, tar.gz, zip and many others.</p> | `true` | `""` |
<!-- action-docs-inputs source="action.yml" -->

<!-- action-docs-outputs source="action.yml" -->

<!-- action-docs-outputs source="action.yml" -->

<!-- action-docs-runs source="action.yml" -->
## Runs

This action is a `docker` action.
<!-- action-docs-runs source="action.yml" -->

## Example Usage

Best practice is to define the following secrets in your Repository, or perhaps best, in your GitHub Organization.

| Secret Name                 | Purpose                                     | Notes                                                                                            |
| --------------------------- | ------------------------------------------- | ------------------------------------------------------------------------------------------------ |
| SONATYPE_LIFECYCLE_URL      | Full URL to your Sonatype Lifecycle server. | If you are connecting to a SaaS environment, ensure you include the `/platform` part of the URL. |
| SONATYPE_LIFECYCLE_USERNAME | Username                                    | Ideally a service account                                                                        |
| SONATYPE_LIFECYCLE_PASSWORD | Password                                    | Ideally a service account                                                                        |

Most folk expect the Sonatype Lifecycle Application ID to be a derivative of the GitHub Repository and/or Organization Name.

This can easily be achieved in your GitHub Action Workflow by using predefined GitHub Variables and setting the result in an Environment Variable.

The below snipped sets `SONATYPE_LIFECYCLE_APPLICATION_ID` to the repository name only:

```
env:
  SONATYPE_LIFECYCLE_APPLICATION_ID: $(echo "${{ github.repository }}" | cut -d '/' -f2)
```

The below examples assume you've defined `SONATYPE_LIFECYCLE_APPLICATION_ID`.

### Maven Build

```
name: Example Workflow with Sonatype Lifecycle Analysis

on: [push]

jobs:
  build:
    name: My Build Job
    runs-on: ubuntu-latest

    steps:
      - name: Checkout Code
        uses: actions/checkout@v4

      # Do some setup like install JDK and Maven

      - name: Build with Maven
        run: mvn package --file pom.xml

      - name: Sonatype Lifecycle Policy Evaluation
        uses: sonatype-nexus-community/iq-github-action@v2
        with:
          serverUrl: ${{ secrets.SONATYPE_LIFECYCLE_URL }}
          username: ${{ secrets.SONATYPE_LIFECYCLE_USERNAME }}
          password: ${{ secrets.SONATYPE_LIFECYCLE_PASSWORD }}
          applicationId: ${{ env.SONATYPE_LIFECYCLE_APPLICATION_ID }}
          stage: Build
          target: ./target/
```

## Migration from v1

`v1` remains available on the `v1` branch and can be used by referencing `sonatype-nexus-community/iq-github-action@v1`.

## The Fine Print

It is worth noting that this is **NOT SUPPORTED** by Sonatype, and is a contribution of ours
to the open source community (read: you!)

Remember:

-   Use this contribution at the risk tolerance that you have
-   Do NOT file Sonatype support tickets related to `iq-github-action` support in regard to this project
-   DO file issues here on GitHub, so that the community can pitch in

Phew, that was easier than I thought. Last but not least of all:

Have fun creating and using `iq-github-action`, we are glad to have you here!
