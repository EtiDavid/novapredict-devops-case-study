# Monitoring and troubleshooting

The Azure staging foundation uses **Log Analytics** and **Application Insights**. During deployment checks I also inspect Azure Container Apps revision state, health/readiness results, logs and HTTP responses.

My typical troubleshooting sequence is:

1. **Confirm the symptom and impact**: is the public page failing, a backend call failing, or a background job delayed?
2. **Check runtime evidence**: current revision, health state, probe results and application logs.
3. **Check dependencies**: database, Redis, secret access, identity permissions or DNS/TLS depending on the symptom.
4. **Change one thing at a time** and repeat the original failing check.
5. **Record expected versus actual** results, including what the test does *not* prove.

A green workflow does not by itself prove the application works; I look for real service behaviour and independent health checks. This public page does not include raw telemetry screenshots because they may expose infrastructure identifiers or user data. Sanitized evidence can be added after review.
