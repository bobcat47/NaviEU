# Security Policy

NaviEU takes security seriously. As a privacy-first navigation app, the security of our users' data and the integrity of our code are paramount.

## Supported Versions

| Version | Status | Security Updates |
|---------|--------|-----------------|
| 0.1.x | ✅ Current | Active |
| < 0.1.0 | ⚠️ Pre-release | Best effort |

## Reporting a Vulnerability

**Please do not report security vulnerabilities through public GitHub issues.**

Instead, report them privately:

- **Email:** security@navieu.dev
- **PGP Key:** `docs/security/pgp-key.asc` (fingerprint in repository)
- **GitHub Private Vulnerability Reporting:** Enabled on this repository

### What to Include

- Description of the vulnerability
- Steps to reproduce
- Potential impact assessment
- Suggested fix (if any)
- Your disclosure timeline preferences

### Response Timeline

| Phase | Timeline |
|-------|----------|
| Acknowledgment | Within 48 hours |
| Initial assessment | Within 7 days |
| Fix development | Depends on severity (critical: <14 days, high: <30 days) |
| Disclosure | Coordinated with reporter |

## Security Practices

### Code Security

- All code changes require peer review
- CI pipeline runs static analysis on every PR
- Dependencies are regularly audited with `flutter pub audit`
- Native code (C/C++) is compiled with security flags

### Build Security

- Release builds are generated via CI (reproducible builds)
- Signing keys are held by core maintainers only
- Build artifacts are checksummed and verified

### Cryptography (V4+)

When mesh networking features are introduced in V4:

- All mesh communication uses Reticulum's cryptographic framework
- Identity keys are generated and stored locally
- No centralized certificate authority
- Forward secrecy for all mesh messages

## Known Security Considerations

| Area | Consideration | Mitigation |
|------|--------------|------------|
| Local storage | Device theft exposes local data | Device encryption; no external storage |
| Map downloads | MITM on update channel | HTTPS with certificate pinning |
| Native code | Memory safety in C++ components | Bounds checking, fuzz testing |
| Third-party deps | Supply chain attacks | Locked versions, automated auditing |

## Disclosure Policy

We follow coordinated disclosure:

1. Reporter submits vulnerability privately
2. We acknowledge and assess
3. We develop and test a fix
4. We prepare a security advisory
5. Fix is released
6. Public disclosure after 30 days or with reporter's consent

## Security-Related Configuration

```yaml
# Example: Building with security flags
flutter build apk --release \
  --dart-define=SECURITY_CHECKS_ENABLED=true \
  --dart-define=CERTIFICATE_PINNING_ENABLED=true
```

## Recognition

Security researchers who responsibly disclose vulnerabilities will be:
- Credited in the security advisory (with their permission)
- Listed in our Security Hall of Fame
- Invited to join our private security discussion channel

---

*Last updated: 2025-06-24*
