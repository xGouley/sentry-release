FROM getsentry/sentry-cli:1.40.0

LABEL "name"="sentry"
LABEL "maintainer"="xGouley <lui@prestashop.com>"
LABEL "version"="1.0.0"

LABEL "com.github.actions.name"="Sentry.io release management"
LABEL "com.github.actions.description"="Sentry.io release support for GitHub Actions"
LABEL "com.github.actions.icon"="activity"
LABEL "com.github.actions.color"="green"

LABEL "repository"="https://github.com/xGouley/sentry-release"
LABEL "homepage"="https://github.com/xGouley/sentry-release"

RUN apk add git

COPY "entrypoint.sh" "/entrypoint.sh"
ENTRYPOINT ["/entrypoint.sh"]
CMD ["help"]
