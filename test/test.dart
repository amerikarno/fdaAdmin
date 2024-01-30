import 'package:encrypt/encrypt.dart'as e;
import 'package:flutter/material.dart';

class EncryptionService {
  final e.Key key;
  final e.IV iv;
  late final e.Encrypter encrypter;

  EncryptionService(
    this.key,
    this.iv,
  ) {
    encrypter = e.Encrypter(e.AES(key, mode: e.AESMode.cbc));
  }

  String encrypt(String plainText) {
    final encrypted = encrypter.encrypt(plainText, iv: iv);
    return encrypted.base64;
  }

  String decrypt(String encryptedText) {
    final encrypted = e.Encrypted.from64(encryptedText);
    return encrypter.decrypt(encrypted, iv: iv);
  }
}

void main() {
  // Your 32 bytes key for AES-256
  final key = e.Key.fromUtf8('32characterslongkeyforaes256encryption!');
  // Initialization Vector
  final iv = e.IV.fromLength(16);

  final encryptionService = EncryptionService(key, iv);

  final encryptedText = encryptionService.encrypt('Hello, Dart!');
  debugPrint('Encrypted: $encryptedText');

  final decryptedText = encryptionService.decrypt(encryptedText);
  debugPrint('Decrypted: $decryptedText');
}
