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
