% The content of this file is duplicated in the README.md because GitHub doesn't
% support the include directive. Remember to change both files!

This is the development and operations documentation for the **Ekklesia e-democracy platform**.

## Goals

The aim of the Ekklesia project is to provide an open, extensible platform for
direct electronic democracy. Organizations have different requirements for
their policy drafting and decision making process. Instead of trying to build
a monolithic one-fits-all solution, we want to integrate existing free
software and provide open interfaces.

Ekklesia is a framework for building e-democracy systems but provides usable
out-of-the-box configuration for common workflows. Applications developed as
part of the platform should be highly customizable themselves, either by
configuration or easy extension on the source code level.

Ekklesia is designed with privacy in mind: applications have to be usable with
pseudonyms, anonymous voting should be supported and personal data must only
be shared with system components if it's really required and with user
consent. Encryption must be used wherever possible, preferably end-to-end
encryption, especially for sensitive content like personal voting
confirmations.

## Features

The available feature set depends on the used components. See the list in the
next section. Most of the listed features are implemented in
[ekklesia-portal](https://github.com/edemocracy/ekklesia-portal).

### For All Users

- Log in using Single-Sign-On for all applications.
- Discuss ideas and collaborate on the development of propositions (motions).
- Search for draft, in-progress and finished propositions using full text and meta data.
- Gather submitters/supporters for a proposition.
- Submit propositions for commission review.
- Write user-generated content using plain text/Markdown.
- Discuss submitted propositions with user-rated/sorted pro and contra arguments.
- Amend propositions and submit counter-propositions.
- Vote anonymously using score voting on ballots with multiple options.
- View documents (like statutes, programs and more) and propose changes.
- View propositions for a specific voting phase (event).
- Change user interface language (currently English, German and partly French support).

### For Administrators

- Set up multiple sub-departments of an organization with different workflow settings.
- Configure proposition types with different properties.
- Customize text content in the user interface, in multiple languages.
- Modify proposition content and meta data for administrative reasons.
- Build custom navigation/overview pages using Markdown in multiple languages.
- Export propositions to OpenSlides (CSV) and import voting results.

### Planned Features

- Switch between multiple languages for user-submitted content with manual and automated translations.
- Dynamic visualization of amendments and document changes.
- Track changes to documents and propositions in version control repositories (Git).
- (Semi-)automated merging of changes into documents.
- Gather arguments and vote recommendations from your social contacts.


## Ekklesia Projects

The platform consists of multiple applications and supporting projects which use
separate repositories. Projects developed by the Ekklesia project can be found in the
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

The projects aims to integrate with externally developed applications
that serve the purpose of creating a e-democracy platform. Currently, we
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

  - motion export to OpenSlides
  - voting result import from OpenSlides

- [VVVote](https://github.com/vvvote/vvvote): cryptographic
  anonymized online voting system

- [Matrix](https://matrix.org): encrypted notifications
