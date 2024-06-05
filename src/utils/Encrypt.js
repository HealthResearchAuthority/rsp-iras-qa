const CryptoJS = require("crypto-js");

// Run this utility to generate an encrypted value. Replace '<Add secret key here>' with the secret key.

var encrypted = CryptoJS.AES.encrypt("sensitive-data", "<Add secret key here>");
var decrypted = CryptoJS.AES.decrypt(encrypted, "<Add secret key here>");

console.log("Encrypted Text: " + encrypted.toString());
console.log("Decrypted Text: " + decrypted.toString(CryptoJS.enc.Utf8));