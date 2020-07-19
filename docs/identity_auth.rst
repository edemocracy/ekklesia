************************************
Identity Management / Authentication
************************************

Ekklesia applications that need to identify users and have access to protected information
like the eligibilty for voting act as OpenID Connect Client (based on OAuth 2).
Currently, we are working with `Keycloak <https://keycloak.org>`_ but other
OpenID Connect compliant solutions  with good configurability may work as well.

Users that want to log in to an Ekklesia application are redirected to the
OpenID Connect provider where they enter their credentials, username and password.
Turning on two-factor-authentication (2FA) should be recommended to users
or even be required to log in.

Expected Claims in the ID Token
===============================

Ekklesia applications use the standard ``sub`` claim in the OpenID Connect ID token.
This should be configured as an "pairwise subject identifier" which means that it's
unique in the context of a single application and is only known to that application.

Applications can save the relationship between ``sub`` and an internal user object
that is used to save additional user data needed by the application.

There could be additional user identifiers that are known to multiple applications if
they need to exchange information about users. This is not used yet but may be needed
for implementing a notification system that can be used by multiple applications.

Portal and voting components need to know if a user can use certain functions that are restricted.
They may use the following claims in the ID token:

* ``verified``: is this an verified user?
  (for example: has been personally identified by some process)
* ``eligible``: is this user eligible to vote?
  (for example: has paid their membership fee for this year?)
* ``external_voter``: is using an external means of voting
  (for example: uses mail-in ballot which prevents voting online)

Applications may need to know the ``roles`` of an user.
Role names may map to the name of a department.
Other roles are ignored.
There may be additional supported role name to specify users with special permission,
for example department administrations and global admins.
