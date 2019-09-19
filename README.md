# IQ for GitHub Actions

Run a Nexus IQ policy evaluation as part of your GitHub Actions workflow.

## Inputs

### `serverUrl`

**Required** Nexus IQ Server URL

### `username`

**Required** Username to connect to IQ Server for policy evaluation

### `password`

**Required** Password to connect to IQ Server for policy evaluation

### `applicationId`

**Required** Determines the policy elements (policies, labels, and license threat groups) to associate with this build, and is managed via the Nexus IQ Server.

### `stage`

**Required** Controls the stage the policy evaluation will be run against on the Nexus IQ Server.

### `target`

**Required** This is the path to a specific application archive file, a directory containing such archives or the ID of a Docker image. For archives, a number of formats are supported, including jar, war, ear, tar, tar.gz, zip and many others.

## The Fine Print

It is worth noting that this is **NOT SUPPORTED** by Sonatype, and is a contribution of ours
to the open source community (read: you!)

Remember:

* Use this contribution at the risk tolerance that you have
* Do NOT file Sonatype support tickets related to `nancy` support in regard to this project
* DO file issues here on GitHub, so that the community can pitch in

Phew, that was easier than I thought. Last but not least of all:

Have fun creating and using IQ for GitHub Actions, we are glad to have you here!

## Getting help

Looking to contribute to our code but need some help? There's a few ways to get information:

* Chat with us on [Gitter](https://gitter.im/sonatype/nexus-developers)