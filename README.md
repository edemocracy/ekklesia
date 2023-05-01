# Ekklesia

[View the full documentation at ReadTheDocs](https://ekklesia.readthedocs.org)

This is the development and operations documentation for the **Ekklesia e-democracy platform**.

## Goals

The aim of the Ekklesia project is to provide an open, extensible platform for
direct electronic democracy. Organisations have different requirements
for their policy drafting and decision-making process. Instead of trying
to build a monolithic one-fits-all solution, we want to integrate
existing free software and provide open interfaces. Ekklesia is a
framework for building e-democracy systems but should still be usable
out-of-the-box for common workflows. Applications developed as part of
the platform should be highly customizable themselves, either by
configuration or easy extension on the source code level.

## Subprojects

The platform consists of multiple applications and supporting projects which use
separate repositories. Project developed by the Ekklesia project can be found in the
[edemocracy organization on GitHub](https://github.com/edemocracy).

- [ekklesia](https://github.com/edemocracy/ekklesia):
  Shared documentation
- [ekklesia-portal](https://github.com/edemocracy/ekklesia-portal):
  Motion portal, public API and administrative interface.
- [ekklesia-voting](https://github.com/edemocracy/ekklesia-voting):
  Pseudonymous voting component
- [ekklesia-notify](https://github.com/edemocracy/ekklesia-notify):
  API for sending notifications to users
- [ekklesia-common](https://github.com/edemocracy/ekklesia-common):
  Common code for the ekklesia platform
- [nix-ekklesia-vvvote](https://github.com/edemocracy/nix-ekklesia-vvvote):
  Automated Nix/NixOS deployment for the VVVote voting system.
- [discourse-ekklesia](https://github.com/edemocracy/discourse-ekklesia):
  Discourse plugin for the Ekklesia platform

## External Software

The project aims to integrate with externally developed applications
that serve the purpose of creating an e-democracy platform. Currently, we
use or are working on integrating the following projects:

- [Discourse](https://discourse.org): platform for community
  discussion

  - collaborative development of motion drafts
  - export/import of motion drafts
  - general discussion tool

- [Keycloak](https://keycloak.org): identity and access management
  with OpenID Connect support

- [OpenSlides](https://openslides.org): digital motion and assembly
  system

  - motion export to Openslides
  - voting result import from Openslides

- [VVVote](https://github.com/vvvote/vvvote): cryptographically
  anonymized online voting system

- [Matrix](https://matrix.org): encrypted notifications
