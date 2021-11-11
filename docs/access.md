# Access

`2021.11`

Access to MiCT systems and application is limited for all users, including
but not limited to workforce members, volunteers, business associates,
contracted providers, consultants, and any other entity, is allowable only on a
minimum necessary basis. All users are responsible for reporting an incident of
unauthorized user or access of the organization's information systems.

## Policy Statements

### Access Control Policy

MiCT policy requires that

(a) Access to all computing resources, including servers, end-user computing
devices, network equipment, services and applications, must be protected by
strong authentication, authorization, and auditing.

(b) Interactive user access must be associated to an account or login unique to
each user.

(c) All credentials, including user passwords, service accounts, and access
keys, must meet the length, complexity, age, and rotation requirements defined
in MiCT security standards.

(d) Use strong password and multi-factor authentication (MFA) whenever possible
to authenticate to all computing resources (including both devices and
applications).

(e) MFA is required to access any critical system or resource, including but not
limited to resources in MiCT production environments.

(f) Unused accounts, passwords, access keys must be removed within 30 days.

(g) A unique access key or service account must be used for different
application or user access.

(h) Authenticated sessions must time out after a defined period of inactivity.

### Access Authorization and Termination

MiCT policy requires that

(a) Access authorization shall be implemented using role-based access control
(RBAC) or similar mechanism.

(b) Standard access based on a user's job role may be pre-provisioned during
employee onboarding. All subsequent access requests to computing resources must
be approved by the requestor’s manager, prior to granting and provisioning of
access.

(c) Access to critical resources, such as production environments, must be
approved by the security team in addition to the requestor’s manager.

(d) Access must be reviewed on a regular basis and revoked if no longer needed.

(e) Upon termination of employment, all system access must be revoked and user
accounts terminated within 24 hours or one business day, whichever is shorter.

(f) All system access must be reviewed at least annually and whenever a user's
job role changes.

### Shared Secrets Management

MiCT policy requires that

(a) Use of shared credentials/secrets must be minimized and approved on an
exception basis.

(b) If required by business operations, secrets/credentials must be shared
securely and stored in encrypted vaults that meet the MiCT data encryption
standards.

(c) Usage of a shared secret to access a critical system or resource must be
supported by a complimenting solution to uniquely identify the user.

### Privileged Access Management

MiCT policy requires that

(a) Users must not log in directly to systems as a privileged user.

  * A privileged user is someone who has administrative access to critical
    systems, such as a Active Directory Domain Administrator, root user to a
    Linux/Unix system, and Administrator or Root User to an AWS account.

(b) Privilege access must only be gained through a proxy, or equivalent, that
supports strong authentication (such as MFA) using a unique individual account
with full auditing of user activities.

(c) Direct administrative access to production systems must be kept to an
absolute minimum.


## Controls and Procedures


### Standards for Access Provisioning

#### Workforce Clearance

1. The level of security assigned to a user to the organization's information
   systems is based on the minimum necessary amount of data access required to
   carry out legitimate job responsibilities assigned to a user's job
   classification and/or to a user needing access to carry out treatment,
   payment, or healthcare operations.
1. All access requests are treated on a "least-privilege" principle.
1. MiCT maintains a minimum necessary approach to access to Partner data.

#### Access Authorization

1. Role based access categories for each MiCT system and application are
   pre-approved by the Security Officer.
2. MiCT utilizes hardware-defined and/or software-defined boundaries to
   segment data, prevent unauthorized access, and monitor traffic for denial of
   service attacks.

#### Person or Entity Authentication

1. Each workforce member has and uses a unique user ID and password that
   identifies him/her as the user of the information system.
1. Each Partner has and uses a unique user ID and password or
   OpenID Connect that identifies him/her as the user of the information system.
1. All partner support interactions must be verified before MiCT support
   personnel will satisfy any request having information security implications.

#### Unique User Identification

1. Access to the MiCT Platform systems and applications is controlled by
   requiring unique User Login IDs and passwords for each individual user and
   developer.
2. Passwords requirements mandate strong password controls (see below).
3. Passwords are not displayed at any time and are not transmitted or stored in
   plain text.
4. Default accounts on all production systems and environments, including root,
   are disabled/locked.
5. Shared accounts are not allowed within MiCT systems or networks.

#### Automatic Logon and Logoff

1. Automated log-on configurations that store user passwords or bypass password
   entry are not permitted for use with MiCT workstations or production
   systems.  

    * Automatic log-on may only be permitted for low-risk systems such as
      conference room PCs connecting to a Zoom Room.
    * Such systems are configured on separate network VLANs.

2. Users are required to make information systems inaccessible by any other
   individual when unattended by the users (ex. by using a password protected
   screen saver or logging off the system).
3. Information systems automatically lock users such as enabling
   password-protected screensaver after 2 minutes or less of inactivity.
4. Information systems automatically enter standby or log users off the systems
   after 30 minutes or less of inactivity.
5. The Security Officer must pre-approves any exception to automatic log off
   requirements.

### Password Management

1. User IDs and passwords are used to control access to MiCT systems and may
   not be disclosed to anyone for any reason.
2. Users may not allow anyone, for any reason, to have access to any information
   system using another user's unique user ID and password.
3. On all production systems and applications in the MiCT environment,
   password configurations are set to require:

    * a minimum length of 12 characters;
    * a mix of upper case characters, lower case characters, and numbers or
      special characters;
    * a 60-day password expiration, or 60-day password expiration for
      administrative accounts;         
    * prevention of password reuse using a history of the last 24 passwords;
    * where supported, modifying at least 6 characters when changing passwords;
    * account lockout after 5 invalid attempts.

    !!! check "Exceptions"
    
        Password expiration may be set to a greater interval if an account is always protected by MFA. 


4. All system and application passwords must be stored and transmitted securely.

    * Where possible, passwords should be stored in a hashed format using a
      salted cryptographic hash function (SHA-256 or stronger NIST compliant standard).
    * Passwords that must be stored in non-hashed format must be encrypted at
      rest pursuant to the requirements in [Data Protection](data-protection.md).
    * Transmitted passwords must be encrypted in flight pursuant to the
      requirements in [Data Protection](data-protection.md).

5. Each information system automatically requires users to change passwords at a
   pre-determined interval as determined by the system owner and/or Security,
   based on the criticality and sensitivity of the data contained within the
   network, system, application, and/or database.
6. Passwords are inactivated immediately upon an employee's termination (refer
   to the [Employee Termination Procedures in HR policy](hr.md)).
7. All default system, application, and Vendor/Partner-provided passwords are
   changed before deployment to production.
8. Upon initial login, users must change any passwords that were automatically
   generated for them.
9. Password change methods must use a confirmation method to correct for user
   input errors.
10. All passwords used in configuration scripts are secured and encrypted.
11. If a user believes their user ID has been compromised, they are required to
    immediately report the incident to the 
    [Security team](mailto:security@mict-international.org).
12. In cases where a user has forgotten their password, password reset
    procedures provided by the IdP shall be followed. The exact process depends
    on the system or application. If help is needed, users shall contact [IT
    Support](mailto:itsupport@mict-international.org) or
    [Security](mailto:security@mict-international.org)
13. An approved password manager is used for to store or share non-critical
    business application passwords.

    * The password manager locally encrypts the password vault with the user's
      master password before synchronizing to the cloud.
    * The master password must follow the password requirements listed above.
    * MFA must enabled in the password manager configuration.
    * Enrollment of the password manager is configured as an application in
      Okta.

14. An automated process/tool is implemented to ensure compromised passwords or
    common dictionary words are not used as passwords.  This is currently
    implemented in Okta.

### Single Sign On

* MiCT selected Google as its primary Identity Provider (IdP) to control
  user access to systems and business applications.

* Single sign-on (SSO) should be used whenever possible instead of local
  authentication.  This centralized approach improves user experience and
  simplifies access management.

* Security team is responsible for the administration of the IdP / SSO system,
  including user and access provisioning. Security team may delegate
  administrative privilege to a subset of the system, such as a specific
  application.

### Multi-factor Authentication

Multi-factor authentication (MFA) is a standard control used by MiCT to
provide strong access control to critical systems and applications, and should
be enabled whenever possible.

MiCT implements Google 2 step verification for MFA.

!!! important

    **Approved MFA methods include:**

    - Hardware MFA token (required for the root user of AWS accounts)
    - A unique cryptographic certificate tied to a device
    - Time-based One-Time Password (TOTP) delivered through a mobile app, such as Google Authenticator
    - One-time passcode delivered through SMS text message (if it is the only supported option)
    - Secure physical facility (if the system or application can only be accessed at that location)


### Role Based Access Control (RBAC)

By default, user access is granted based on the user's job function / role.
For example:

- Developer
- Security
- IT
- Administrative
- Marketing / Sales

This is defined as **user groups** in Google Workspace.

Access to sensitive data and production partner data is highly restricted and
further defined in its own section.

### Remote Access / VPN

* VPN remote access to MiCT office network(s) is configured via
  **OpenVPN**, and should be used whenever connecting from public networks.


### Platform Partner Access to Systems

MiCT does not allow direct system access by partners. Access is only
available through the Web UI or API interface, with valid authentication and
authorization.

### Access Establishment, Modification and Termination

1. Requests for access to MiCT Platform systems and applications is made
   formally using the following process:

    1. An access request is created in Github through either the new employee
       onboarding request or a specific access request from MiCT Internal
       Support site.
    2. The Security team will grant standard access to per job role as part of
       new employee onboarding. A standard set of accounts that are default for
       all employees are created as part of the onboarding process. This
       includes
       
        - User account for local system/laptop
        - Google Workspace user in the Everyone group, and additional group based on role
          such as Development, IT, Security
        - Additional role based access
        
    3. Standard access may be provisioned at any time by account
       owners/administrators at any time during or after onboarding with
       approval of account owners and/or manager.
    4. If additional access is needed in addition to the above, a separate
       access request (through Github) is required and the requester must include
       a description and justification as part of the access request.
    5. Once the review is completed, the Security team approves or rejects the
       Issue. If the Issue is rejected, it goes back for further review and
       documentation.
    6. If the review is approved, IT or Security team provisions access, then
       marks the Issue as Done, adding any pertinent notes required.
       
        * New accounts will be created with a temporary secure password that
          meets all password requirements, which must be changed on the initial
          login.
        * All password exchanges must occur over an authenticated channel.
        * For on-premise systems, access grants are accomplished by adding the
          appropriate user account to the corresponding LDAP/AD group.
        * For cloud accounts, access grants are provisioned in Okta or using the
          access control mechanisms built into those services/applications.
        * Account management for non-production systems may be delegated to a
          MiCT employee at the discretion of the Security Officer.

2. Special access, including access to production environments, is not granted
   until receipt, review, and approval by the MiCT Security Officer.
3. The request for access is retained for future reference.
4. Temporary accounts are not used unless absolutely necessary for business
   purposes.

    * Accounts are reviewed every 90 days to ensure temporary accounts are not
      left unnecessarily.
    * Accounts that are inactive for over 90 days are removed.

5. In the case of non-personal information, such as generic educational content,
   identification and authentication may not be required.

#### Access Termination

IT Manager or Security team receives access termination requests in one of the
following conditions and processes it accordingly:

* Employee existing/termination, as defined by the process in 
  [HR & Employee Security](hr.md);
* Employee access to a system is no longer required as a result of job role
  change or similar event, in which case a access termination request may be
  submitted by the employee or his/her manager via the Internal Help portal or
  an email request to Security team;
* As the result of a Access Review, as defined in 
  [System Auditing](system-audit.md).
* Non-standard access is revoked by default after 30 days of inactivity, unless
  an exception/extension is requested and approved.

### Access Reviews

* All access to MiCT systems and services are reviewed and updated following
  the procedures specified in [System Auditing](system-audit.md) to ensure proper
  authorizations are in place commensurate with job functions.
* In cases of increased risk or known attempted unauthorized access, immediate
  steps are taken by the Security and Privacy Officer to limit access and reduce
  risk of unauthorized access.

### Privileged Access

Privileged users must first access systems using standard, unique user accounts
before elevating the privilege or switching to privileged users and performing
privileged tasks.  Examples include:

* `sudo` in Linux/macOS
* `Run as Administrator` in Windows
* `Assume role` in AWS

### Service Accounts

* All application to application communication using service accounts is
  restricted and not permitted unless absolutely needed. Automated tools are
  used to limit account access across applications and systems.

* Generic accounts are not allowed on MiCT systems.

* Direct system to system, system to application, and application to application
  authentication and authorization are limited and controlled to restrict
  access.

* An inventory of all Service accounts is maintained and reviewed periodically.

### Employee Workstation / Endpoints Access and Usage

All workstations at MiCT are company owned, using one the following approved
hardware vendors and operating systems:

* Apple, Dell, or Lenovo
* macOS, Linux (Ubuntu or Debian), or Windows 10

1. Workstations may not be used to engage in any activity that is illegal or is
   in violation of organization's policies.
2. Access may not be used for transmitting, retrieving, or storage of any
   communications of a discriminatory or harassing nature or materials that are
   obscene or "X-rated". Harassment of any kind is prohibited. No messages with
   derogatory or inflammatory remarks about an individual's race, age,
   disability, religion, national origin, physical attributes, sexual
   preference, or health condition shall be transmitted or maintained. No
   abusive, hostile, profane, or offensive language is to be transmitted through
   organization's system.
3. Information systems/applications also may not be used for any other purpose
   that is illegal, unethical, or against company policies or contrary to
   organization's best interests. Messages containing information related to a
   lawsuit or investigation may not be sent without prior approval.
4. Solicitation of non-company business, or any use of organization's
   information systems/applications for personal gain is prohibited.
5. Users may not misrepresent, obscure, suppress, or replace another user's
   identity in transmitted or stored messages.
6. Workstation hard drives will be encrypted using FileVault (macOS), BitLocker
   (Windows) or equivalent.
7. All workstations must have host firewalls enabled to prevent unauthorized
   access unless explicitly granted.
8. All workstations must have endpoint security software installed and actively
   running, if supported by the operating system.

### Office Network and Wireless Access

1. MiCT production systems are not accessible directly over wireless
   channels.
2. Wireless access is disabled on all production systems where not required.
3. When accessing production systems via remote wireless connections, the same
   system access policies and procedures apply to wireless as all other
   connections, including wired.
4. Wireless networks managed within MiCT non-production facilities (offices,
   etc.) are secured with the following configurations:

    * All data in transit over wireless is encrypted using WPA2 encryption;
    * Passwords are not currently on a rotation schedule because the office
      environments are considered insecure.  
    * Passwords are changed immediately should a suspicious activity or
      indicator of compromise is detected.
    * Guest wireless access is on a separate SSID configured with different
      password and traffic VLAN.
    * Wireless access is managed by the IT Manager.
    * Wireless access points connected to the network are automatically
      scanned; rogue access points identified are immediately removed.

### Production Access and Secrets Management

MiCT leverages a combination of [https:&#x2F;&#x2F;localhost credentials
store](https://support.cloudbees.com/hc/en-us/articles/203802500-Injecting-Secrets-into-https:&#x2F;&#x2F;localhost-Build-Jobs),
[credstash](https://github.com/fugue/credstash), and [Amazon EC2 Systems Manager
Parameter
Store](https://aws.amazon.com/blogs/mt/the-right-way-to-store-secrets-using-parameter-store/)
to securely store production secrets.  Secrets are always encrypted; access to
secrets is always controlled and audited.

Details and usage are documented on the MiCT Engineering Wiki.

### Production Data Access

The following requirements and controls are in place for accessing production
data by internal personnel:

- Access to staff data is granted on a per-account basis.

- Access requests follow the same production access processes. Access must be
  approved by both the data owner and the security team.

- Access to production data is granted only through an approved platform with
  strong centralized access control, with MFA.
  
- An audit list of who has access to which partner data is maintained and
  reviewed monthly. Access is revoked when no longer needed.


### Password Reset and other Helpdesk Requests

MiCT employees have the ability to obtain self-service support directly from
supported business applications, such as password reset via the SSO/IdP tool.

If needed, users may use our internal service desk or email request to obtain IT
and Security support.

A ticket is for each support request and assigned to the
appropriate personnel.  The person assigned must verify the identity of the
requester and ensure the ticket has appropriate approval before implementing or
providing support.  
Additionally, if a password or security credential has been created
or supplied, confirm user has received it via another channel like
slack/email/phone/zoom.
