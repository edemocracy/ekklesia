Ekklesia
========

This is the development and operations documentation for the **Ekklesia e-democracy platform**.

`View the full documentation at ReadTheDocs <https://ekklesia.readthedocs.org>`_

Goals
-----

The aim of the Ekklesia project is to provide an open, extensible platform for
direct electronic democracy. Organisations have different requirements
for their policy drafting and decision making process. Instead of trying
to build a monolithic one-fits-all solution, we want to integrate
existing free software and provide open interfaces. Ekklesia is a
framework for building e-democracy systems but should still be usable
out-of-the-box for common workflows. Applications developed as part of
the platform should be highly customizable themselves, either by
configuration or easy extension on the source code level.

Subprojects
-----------

The platform consists of multiple applications and supporting projects which use
separate repositories. Project developed by the Ekklesia project can be found in the
`edemocracy organization on Github <https://github.com/edemocracy>`_.

-  `ekklesia <https://github.com/edemocracy/ekklesia>`_:
   Shared documentation
-  `ekklesia-portal <https://github.com/edemocracy/ekklesia-portal>`_:
   Motion portal, public API and administrative interface.
-  `ekklesia-voting <https://github.com/edemocracy/ekklesia-voting>`_:
   Pseudonymous voting component
-  `ekklesia-common <https://github.com/edemocracy/ekklesia-common>`_:
   Common code for the ekklesia platform
-  `nix-ekklesia-vvvote <https://github.com/edemocracy/nix-ekklesia-vvvote>`_:
   Automated Nix/NixOS deployment for the VVVote voting system.
-  `discourse-ekklesia <https://github.com/edemocracy/discourse-ekklesia>`_:
   Discourse plugin for the Ekklesia platform


External Software
-----------------

The projects aims to integrate with externally developed applications
that serve the purpose of creating a e-democracy platform. Currently, we
use or are working on integrating the following projects:

-  `Discourse <https://discourse.org>`_: platform for community
   discussion

   -  collaborative development of motion drafts
   -  export/import of motion drafts
   -  general discussion tool

-  `Keycloak <https://keycloak.org>`_: identity and access management
   with OpenID Connect support
-  `OpenSlides <https://openslides.org>`_: digital motion and assembly
   system

   -  motion export to Openslides
   -  voting result import from Openslides

-  `VVVote <https://github.com/vvvote/vvvote>`_: cryptographic
   anonymized online voting system
