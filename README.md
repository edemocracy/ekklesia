# Ekklesia

**Ekklesia e-democracy platform**

## Goals

The aim of this project is to provide an open, extensible platform for direct electronic democracy.
Organisations have different requirements for their policy drafting and decision making process.
Instead of trying to build a monolithic one-fits-all solution, we want to integrate existing free software and provide open interfaces.
Ekklesia is a framework for building e-democracy systems but should still be usable out-of-the-box for common workflows.
Applications developed as part of the platform should be highly customizable themselves, either by configuration or easy extension on the source code level.


## Subprojects

This repository is a place for shared documentation.
The platform consists of multiple applications and supporting projects which use separate repositories.

Currently available in public:

* [ekklesia-portal](https://github.com/Piratenpartei/ekklesia-portal): Motion portal, public API and administrative interface
  * You can visit a running instance at [antrag.piratenpartei.de](https://antrag.piratenpartei.de)
* [ekklesia-common](https://github.com/Piratenpartei/ekklesia-common): Common code for the ekklesia platform
* [discourse-ekklesia](https://github.com/Piratenpartei/discourse-ekklesia): Discourse plugin for the Ekklesia platform

Coming up next:

* ekklesia-voting: pseudonymous online voting system


## External Software

The projects aims to integrate with externally developed applications that serve the purpose of creating a e-democracy platform. Currently, we use or are working on integrating the following projects:

* [Discourse](https://discourse.org): platform for community discussion
  * collaborative development of motion drafts
  * export/import of motion drafts
  * general discussion tool
* [Keycloak](https://keycloak.org): identity and access management with OpenID Connect support
* [OpenSlides](https://openslides.org): digital motion and assembly system
  * motion export to Openslides
  * voting result import from Openslides
* [VVVote](https://github.com/vvvote/vvvote): cryptographic anonymized online voting system
