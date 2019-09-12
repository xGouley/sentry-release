# GitHub Action to publish new Sentry.io releases

Action wraps the [Sentry CLI](https://docs.sentry.io/cli/) to publish new releases on Sentry.io.

## Usage

An example workflow to release a new Sentry version:

```yml
name: Sentry release
on:
  release:
    types: [published, edited]
      
jobs:
  sentry:
    name: Sentry release for ${{ github.ref }}
    # This job runs on Linux
    runs-on: ubuntu-latest
    steps:
      - name: Create release on Sentry
        uses: "xGouley/sentry-release@master"
        secrets: ["SENTRY_AUTH_TOKEN"]
        env:
          - SENTRY_ORG: ${{ secrets.SENTRY_ORG }}
          - SENTRY_PROJECT: ${{ github.ref ??? }}
          - ENVIRONMENT: "development"
          - SHA: ${{ github.sha }}
```

### Secrets

- `SENTRY_AUTH_TOKEN` - **Required**. The authentication token to use for all communication with Sentry. ([more info](https://docs.sentry.io/cli/configuration/))
- `SENTRY_ORG` - **Required**. The slug of the organization to use for a command.
- `SENTRY_PROJECT` - **Required**. The slug of the project to use for a command.

### Environment variables
- `ENVIRONMENT`- **Required**. The environement to give to Sentry.
- `SHA` - **Required**. The commit for this tag. Please keep ${{ github.sha }}.
- `RELEASE_VERSION` - **Optional**. Custom version tag. Defaults to `${SENTRY_PROJECT}@$(git describe --always --long)`.

## Attribution

Forked and adapted from [Juan Jose Karam Action](https://github.com/juankaram/sentry-release).

## License

The Dockerfile and associated scripts and documentation in this project are released under the [MIT License](LICENSE).
