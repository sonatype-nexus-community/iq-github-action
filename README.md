# Nexus IQ for GitHub Actions

Run a Nexus IQ policy evaluation as part of your GitHub Actions workflow.

- [Description](#description)
- [Inputs](#inputs)
- [Runs](#runs)
- [Example Usage](#example-usage)
- [The Fine Print](#the-fine-print)
- [Getting help](#getting-help)


<!-- action-docs-header source="action.yml" -->

<!-- action-docs-header source="action.yml" -->

<!-- action-docs-description source="action.yml" -->
## Description

Run a Nexus IQ policy evaluation as part of your GitHub Actions workflow.
<!-- action-docs-description source="action.yml" --> 

<!-- action-docs-inputs source="action.yml" -->
## Inputs

| name | description | required | default |
| --- | --- | --- | --- |
| `serverUrl` | <p>Nexus IQ Server URL</p> | `true` | `""` |
| `username` | <p>Username to connect to IQ Server for policy evaluation</p> | `true` | `""` |
| `password` | <p>Password to connect to IQ Server for policy evaluation</p> | `true` | `""` |
| `applicationId` | <p>Determines the policy elements (policies, labels, and license threat groups) to associate with this build, and is managed via the Nexus IQ Server.</p> | `true` | `""` |
| `stage` | <p>Controls the stage the policy evaluation will be run against on the Nexus IQ Server.</p> | `true` | `Build` |
| `target` | <p>This is the path to a specific application archive file, a directory containing such archives or the ID of a Docker image. For archives, a number of formats are supported, including jar, war, ear, tar, tar.gz, zip and many others.</p> | `true` | `""` |
<!-- action-docs-inputs source="action.yml" -->

<!-- action-docs-outputs source="action.yml" -->

<!-- action-docs-outputs source="action.yml" -->

<!-- action-docs-runs source="action.yml" -->
## Runs

This action is a `docker` action.
<!-- action-docs-runs source="action.yml" -->

## Example Usage

Maven Build

```
name: Maven CI with Nexus IQ

on: [push]

jobs:
  build:

    runs-on: ubuntu-latest

    steps:
    - uses: actions/checkout@v1
    - name: Set up JDK 1.8
      uses: actions/setup-java@v1
      with:
        java-version: 1.8
    - name: Build with Maven
      run: mvn package --file pom.xml
    - name: Nexus IQ Policy Evaluation
      uses: sonatype-nexus-community/iq-github-action@v1
      with:
        serverUrl: http://nexus-iq-server
        username: username
        password: ${{ secrets.password }}
        applicationId: sample-maven
        stage: Build
        target: ./target/
```

## The Fine Print

It is worth noting that this is **NOT SUPPORTED** by Sonatype, and is a contribution of ours
to the open source community (read: you!)

Remember:

* Use this contribution at the risk tolerance that you have
* Do NOT file Sonatype support tickets related to `IQ for GitHub Actions` support in regard to this project
* DO file issues here on GitHub, so that the community can pitch in

Phew, that was easier than I thought. Last but not least of all:

Have fun creating and using IQ for GitHub Actions, we are glad to have you here!

## Getting help

Looking to contribute to our code but need some help? There's a few ways to get information:

* Chat with us on [Gitter](https://gitter.im/sonatype/nexus-developers)
