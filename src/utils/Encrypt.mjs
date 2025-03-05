import { createCipheriv, createDecipheriv } from 'crypto';

// Run this utility to generate an encrypted value. Replace '<Add secret key here which is 32 character long>' with the secret key. This should be 32 characters long.
// Replace "sensitive-data" with user password

const encryption_key = '<Add secret key here which is 32 character long>';
const textToEncrypt = '<sensitive-data>';

function encrypt(text) {
  const cipher = createCipheriv('AES-256-GCM', Buffer.from(encryption_key), Buffer.alloc(16));
  var crypted = cipher.update(text, 'utf8', 'hex');
  crypted += cipher.final('hex');
  return crypted;
}

function decrypt(text) {
  const decipher = createDecipheriv('AES-256-GCM', Buffer.from(encryption_key), Buffer.alloc(16));
  let dec = decipher.update(text, 'hex', 'utf8');
  dec += decipher.final('utf8');
  return dec;
}

var encrypted = encrypt(textToEncrypt);

// Encrypting
console.log('Encrypted Value: ' + encrypted);

// Decrypting
console.log('Decrypted Value: ' + decrypt(encrypted));
