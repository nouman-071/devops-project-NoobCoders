# NoobCoders

## Project
Java Project that contains , AmazonMQ , MYSQL , Nginx as a Load Balancer and a tomcat server.

## Team members
- Nouman Yousaf — 23-NTU-CS-1202 — GitHub: nouman-071
- Abdur Rehman — 23-NTU-CS-1180 — GitHub: ia-rehman05

## Repository owner
Nouman Yousaf — nouman-071

## Communication
Whatsapp

## Review turnaround
We agree to respond to pull request reviews within one working day.

## Contribution workflow
Create a feature branch and open a pull request.
Another team member must review and approve the change.
Address and resolve review conversations before merging.
Direct pushes to main are blocked.

## Lab 05: Markdown build tool

The repository also contains the Lab 05 Markdown-to-HTML build tool.

Requirements: Node.js 20 or newer, npm, and GNU Make.

Build, test, and package:

```bash
make ci
```

This installs locked dependencies, builds the Markdown sources, runs
three tests, and creates an npm package archive.

The package is named @nouman-071/devops-pipeline and provides the
devops-build command:

```bash
devops-build input.md output.html
```

Generated HTML, node_modules, and package archives are not committed.
