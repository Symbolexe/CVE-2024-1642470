# Windows USB Generic Parent Driver Remote Code Execution Vulnerability (CVE-2024-1642470)

## Overview

This repository contains a proof-of-concept (PoC) exploit code and a detection script for the Windows USB Generic Parent Driver Remote Code Execution Vulnerability, identified as CVE-2024-1642470.

### Description

CVE-2024-1642470 is a critical vulnerability discovered in the Windows USB Generic Parent Driver. The vulnerability arises due to improper input validation within the driver's IOCTL handling mechanism. As a result, remote attackers can execute arbitrary code via crafted IOCTL requests, potentially leading to system compromise.

### Exploit Code

The exploit code included in this repository demonstrates the exploitation of the CVE-2024-1642470 vulnerability. It leverages a crafted IOCTL request to trigger a buffer overflow condition within the vulnerable driver, allowing arbitrary code execution on the affected system.

### Proof-of-Concept (PoC)

A proof-of-concept script is provided to demonstrate the presence of the vulnerable driver on a system. The script attempts to open the device corresponding to the vulnerable driver and checks for its existence.

## Usage

### Exploit Code

To use the exploit code:

1. Compile the exploit code if necessary.
2. Run the compiled executable on a target system to trigger the vulnerability.

### Proof-of-Concept (PoC)

To use the PoC script:

1. Run the script on a target system to check for the presence of the vulnerable driver.
2. Review the output to determine if the vulnerable driver is found.

## Disclaimer

This repository is for educational and research purposes only. Use the exploit code and PoC script responsibly and in compliance with applicable laws and regulations. The author assumes no liability for any misuse or damage caused by the use of the provided code.

## Author

- Yasin Saffari (Symbolexe)

## License

This project is licensed under the [MIT License](LICENSE).
