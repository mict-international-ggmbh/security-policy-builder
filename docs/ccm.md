# Configuration and Change Management

`2021.11`

MiCT standardizes and automates configuration management through the use of
automation scripts as well as documentation of all changes to production systems
and networks. Automation tools such as Chef, Salt, and Terraform automatically
configure all MiCT systems according to established and tested policies, and
are used as part of our Disaster Recovery plan and process.

## Policy Statements

MiCT policy requires that:

(a) All production changes, including but not limited to software deployment,
feature toggle enablement, network infrastructure changes, and access control
authorization updates, must be invoked through approved change management
process.

(b) Each production change must maintain complete traceability to fully document
the request, including requestor, date/time of change, actions taken and
results.

(c) Each production change must be fully tested prior to implementation.

(d) Each production change must include a rollback plan to back out the change
in the event of failure.

(e) Each production change must include proper approval.

  * The approvers are determined based on the type of change.
  * Approvers must be someone other than the author/executor of the change.
  * Approvals may be automatically granted if certain criteria is met.
    The auto-approval criteria must be pre-approved by the Security Officer and
    fully documented and validated for each request.



## Controls and Procedures


### Configuration Management Processes

1. Configuration management is automated using industry-recognized tools like
   Chef, Salt and Terraform to enforce secure configuration standards.

2. All changes to production systems, network devices, and firewalls are
   reviewed and approved by Security team before they are implemented to assure
   they comply with business and security requirements.

3. All changes to production systems are tested before they are implemented in
   production.

4. Implementation of approved changes are only performed by authorized
   personnel.

5. Tooling is used to generate an up to date system inventory.

    * All systems are categorized and labeled by their corresponding
      environment, such as *dev*, *test*, and *prod*.
    * All systems are classified and labeled based on the data they store or
      process, according to [MiCT data classification
      model](assets/data-classification-and-handling.pdf).
    * The Security team maintains automation which monitors all changes to IT
      assets, generates inventory lists, using automatic IT assets discovery,
      and services provided by each cloud provider.
    * IT assets database is used to generate the diagrams and asset lists
      required by the Risk Assessment phase of MiCT's
      [Risk Management procedures](risk-mgmt.md)
    * MiCT Change Management process ensures that all asset inventory
      created by automation is reconciled against real changes to production
      systems. This process includes periodic manual audits and approvals.
    * During each change implementation, the change is reviewed and verified by
      the target asset owner as needed.

6. MiCT uses the [Security Technical Implementation Guides
   (STIGs)](http://iase.disa.mil/stigs/) published by the Defense Information
   Systems Agency as a baseline for hardening systems.

    * Windows-based systems use a baseline Active Directory group policy
      configuration in conjunction with the DISA STIGs.
    * Linux-based systems use Red Hat Enterprise Linux STIG as a guideline for
      implementation.
    * EC2 instances in AWS are provisioned using only hardened and approved
      Amazon Machine Images (AMIs).
    * Docker containers are launched using only approved Docker images that have
      been through security testing.

7. All IT assets in MiCT have time synchronized to a single
   authoritative source.

    * On-premise systems are configured to point to an internal NTP server.
    * The internal NTP server and all AWS instances are pointing to the same set
      of ntp.org servers.

6. All frontend functionality (e.g. user dashboards and portals) is separated
   from backend (e.g. database and app servers) systems by being deployed on
   separate servers or containers.

7. All software and systems are required to complete full-scale testing before
   being promoted to production.

8. All code changes are reviewed to assure software code quality, while in
   development, to proactively detect potential security issues using
   pull-requests and static code analysis tools.  More details can be found in
   the *Software Release / Code Promotion* section.


### Configuration Monitoring and Auditing

All infrastructure and system configurations, including all software-defined
sources, are centrally aggregated to a configuration management database (CMDB)

Configuration auditing rules are created according to established baseline,
approved configuration standards and control policies. Deviations,
misconfigurations, or configuration drifts are detected by these rules and
alerted to the security team.


### Production Systems Provisioning

1. Before provisioning any systems, a request must be created and approved in
   the Production Change Management process.

2. The security team must approve the provisioning request before any new system
   can be provisioned, unless a pre-approved automation process is followed.

3. Once provisioning has been approved, the implementer must configure the new
   system according to the standard baseline chosen for the system's role.

4. If the system will be used to store sensitive information, the implementer
   must ensure the volume containing this sensitive data is encrypted.

5. Sensitive data in motion must always be encrypted.

6. A security analysis is conducted once the system has been provisioned.  This
   can be achieved either via automated configuration/vulnerability scans or
   manual inspection by the security team. Verifications include, but is not
   limited to:

    * Removal of default users used during provisioning.
    * Network configuration for system.
    * Data volume encryption settings.
    * Intrusion detection and virus scanning software installed.

7. The new system is fully promoted into production upon successful verification
   against corresponding MiCT standards and change request approvals.

### User Endpoint Security Controls and Configuration

1. Employee laptops, including Windows, Mac, and Linux systems, are configured
   either

    * Manually by IT or the device owner; or
    * Automatically using a configuration management tool or equivalent scripts.

2. The following security controls are applied at the minimum:

    * Disk encryption
    * Unique user accounts and strong passwords
    * Approved NTP servers
    * Approved security agents
    * Locking after 20 mins of inactivity
    * Auto-update of security patches

3. The security configurations on all end-user systems are inspected by Security
   through either a manual periodic review or an automated compliance auditing
   tool.


### Server Hardening Guidelines and Processes

1. **Linux System Hardening:** Linux systems have their baseline security
   configuration applied via automation tools. These tools cover:

    * Ensuring that the machine is up-to-date with security patches and is
      configured to apply patches in accordance with our policies.
    * Stopping and disabling any unnecessary OS services.
    * Apply applicable DISA STIGs to OS and applications.
    * Configuring 15-minute session inactivity timeouts for SSH sessions.
    * Installing and configuring the virus scanner.
    * Installing and configuring the NTP daemon, including ensuring that
      modifying system time cannot be performed by unprivileged users.
    * Configuring disk volumes for providers that do not have native support for
      encrypted data volumes, including ensuring that encryption keys are
      protected from unauthorized access.
    * Configuring authentication to the centralized Directory Services servers.
    * Configuring audit logging as described in the [Auditing Policy
      section](system-audit.md).

1. **Windows System Hardening:** Windows systems have their baseline security
   configuration applied via the combination of Group Policy settings and/or
   automation scripts. These baseline settings cover:

    * Joining the Windows Domain Controller and applying the Active Directory
      Group Policy configuration (for AD-managed systems only).
    * Ensuring that the machine is up-to-date with security patches and is
      configured to apply patches in accordance with our policies.
    * Apply applicable DISA STIGs to OS and applications.
    * Stopping and disabling any unnecessary OS services.
    * Configuring session inactivity timeouts.
    * Installing and configuring security protection agents such as anti-virus
      scanner.
    * Configuring transport encryption according to the requirements described
      in the [Mobile Device Security and Disposable Media Management
      section](mdm.md).
    * Configuring the system clock to point to approved NTP servers and ensuring
      that modifying system time cannot be performed by unprivileged users.
    * Configuring audit logging as described in the [Auditing Policy
      section](system-audit.md).

1. Any additional configuration changes applied to hardened Windows systems must
   be clearly documented by the implementer and reviewed by the Security team.

### Configuration and Provisioning of Management Systems

1. Provisioning management systems such as configuration management servers,
   remote access infrastructure, directory services, or monitoring systems follows
   the same procedure as provisioning a production system.

2. Critical infrastructure roles applied to new systems must be clearly
   documented by the implementer in the change request.


### Configuration and Management of Network Controls

All network devices and controls on a sensitive network are configured such
that:

* Vendor provided default configurations are modified securely, including

  - default encryption keys,
  - default SNMP community strings, if applicable,
  - default passwords/passphrases, and
  - other security-related vendor defaults, if applicable.

* Encryption keys and passwords are changed anytime anyone with knowledge of the
  keys or passwords leaves the company or changes positions.

* Traffic filtering (e.g. firewall rules) and inspection (e.g. Network IDS/IPS
  or AWS VPC flow logs) are enabled.

* An up-to-date network diagram is maintained.

In AWS, network controls are implemented using Virtual Private Clouds (VPCs) and
Security Groups. The configurations are managed as code and stored in approved
repos. All changes to the configuration follow the defined code review, change
management and production deployment approval process.

### Patch Management Procedures

**Local Systems**

MiCT uses automated tooling to ensure systems are up-to-date
with the latest security patches.

* On local Linux and Windows systems, the unattended-upgrades tool is used to
  apply security patches in phases.

    - High Risk security patches are automatically applied as they are released
    - Monthly system patching for regular applications are applied as needed.
    - Snapshotting of a system will take place before an update is applied.
    - Once the update is deemed stable the snapshot will be removed.
    - In case of failure of the update the snapshot will be rolled back.
    - If the staging systems function properly after the two-week testing
      period, the security team will promote that snapshot into the mirror used
      by all production systems. These patches will be applied to all production
      systems during the next nightly patch run.
    - The patching process may be expedited by the Security team
    - On Windows systems, the baseline Group Policy setting configures Windows
      Update to implement the patching policy.

**User Endpoints**

MiCT requires auto-update for security patches to be enabled for
all user endpoints, including laptops and workstations.

* The auto-update configuration and update status on all end-user systems are
  inspected by Security through either manual periodic audits or automated
  compliance auditing agents installed on the endpoints.

### Emergency Change

In the event of an emergency, the person or team on call is notified.  This may
include a combination or Development, IT, and Security.

If an emergency change must be made, such as patching of a zero-day security
vulnerability or recovering from a system downtime, and that the standard change
management process cannot be followed due to time constraint or personnel
availability or other unforeseen issues, the change can be made by:

* **Notification:** The Engineering Lead, Security Lead, and/or IT Lead must be
  notified by email, Slack, or phone call prior to the change . Depending on the
  nature of the emergency, the leads may choose to inform members of the
  executive team.

* **Access and Execution:** Manually access of the production system or manual
  deploy of software, using one of the following access mechanisms as defined in
  [Access Control policy and procedures](access.md):

    1. Support/Troubleshooting access
    2. Root account or root user access
    3. Local system access (for on-premise environment)

* **Post-emergency Documentation:** A ticket should be created within 24
  hours following the emergency change.  The ticket should contains all details
  related to the change, including:

    * Reason for emergency change
    * Method of emergency access used
    * Steps and details of the change that was made
    * Sign-off/approvals must be obtained per the type of change as defined by
      the standard CM process

* **Prevention and Improvement:** The change must be fully reviewed by Security
  and Engineering together with the person/team responsible for the change.  Any
  process improvement and/or preventative measures should be documented and an
  implementation plan should be developed.
