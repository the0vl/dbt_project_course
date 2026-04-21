#!/bin/bash

# 1. Clean up old mess
echo "Cleaning up old keys..."
rm -f rsa_key*.pem rsa_key*.p8 rsa_key*.pub encrypted_rsa_key.pem

# 2. Generate a new Private Key (Encrypted with your passphrase)
# We use the passphrase you provided: 2357146915Theo
echo "Generating new private key..."
openssl genrsa 2048 | openssl pkcs8 -topk8 -v2 des3 -inform PEM -out rsa_key.p8 -passout pass:2357146915Theo

# 3. Generate the matching Public Key
echo "Generating matching public key..."
openssl rsa -in rsa_key.p8 -pubout -out rsa_key.pub -passin pass:2357146915Theo

# 4. Set strict permissions (Snowflake requirement)
chmod 600 rsa_key.p8

echo "------------------------------------------------"
echo "DONE! New keys generated: rsa_key.p8 and rsa_key.pub"
echo "------------------------------------------------"
echo "COPY THE TEXT BELOW AND PASTE IT INTO SNOWFLAKE:"
echo "------------------------------------------------"
grep -v "BEGIN PUBLIC KEY" rsa_key.pub | grep -v "END PUBLIC KEY" | tr -d '\n'
echo -e "\n------------------------------------------------"