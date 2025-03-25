// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Username`
  String get username {
    return Intl.message(
      'Username',
      name: 'username',
      desc: '',
      args: [],
    );
  }

  /// `Enter`
  String get enter {
    return Intl.message(
      'Enter',
      name: 'enter',
      desc: '',
      args: [],
    );
  }

  /// `close`
  String get close {
    return Intl.message(
      'close',
      name: 'close',
      desc: '',
      args: [],
    );
  }

  /// `Error`
  String get error {
    return Intl.message(
      'Error',
      name: 'error',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirm {
    return Intl.message(
      'Confirm',
      name: 'confirm',
      desc: '',
      args: [],
    );
  }

  /// `Retry`
  String get retry {
    return Intl.message(
      'Retry',
      name: 'retry',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Message`
  String get message {
    return Intl.message(
      'Message',
      name: 'message',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message(
      'Logout',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Loading`
  String get loading {
    return Intl.message(
      'Loading',
      name: 'loading',
      desc: '',
      args: [],
    );
  }

  /// `Visit`
  String get visit {
    return Intl.message(
      'Visit',
      name: 'visit',
      desc: '',
      args: [],
    );
  }

  /// `Others`
  String get others {
    return Intl.message(
      'Others',
      name: 'others',
      desc: '',
      args: [],
    );
  }

  /// `Samsung`
  String get samsung {
    return Intl.message(
      'Samsung',
      name: 'samsung',
      desc: '',
      args: [],
    );
  }

  /// `Windows`
  String get windows {
    return Intl.message(
      'Windows',
      name: 'windows',
      desc: '',
      args: [],
    );
  }

  /// `Apple`
  String get apple {
    return Intl.message(
      'Apple',
      name: 'apple',
      desc: '',
      args: [],
    );
  }

  /// `Website`
  String get website {
    return Intl.message(
      'Website',
      name: 'website',
      desc: '',
      args: [],
    );
  }

  /// `Values must be alphanumeric`
  String get msgMustBeAlphaNumeric {
    return Intl.message(
      'Values must be alphanumeric',
      name: 'msgMustBeAlphaNumeric',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your username`
  String get msgEnterUsername {
    return Intl.message(
      'Please enter your username',
      name: 'msgEnterUsername',
      desc: '',
      args: [],
    );
  }

  /// `Must not exceed 24 characters`
  String get msgNotExceed24 {
    return Intl.message(
      'Must not exceed 24 characters',
      name: 'msgNotExceed24',
      desc: '',
      args: [],
    );
  }

  /// `Verify It's You`
  String get msgVerify {
    return Intl.message(
      'Verify It\'s You',
      name: 'msgVerify',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your 6 digit PIN`
  String get msgEnterPin {
    return Intl.message(
      'Please enter your 6 digit PIN',
      name: 'msgEnterPin',
      desc: '',
      args: [],
    );
  }

  /// `Logging In`
  String get msgLogin {
    return Intl.message(
      'Logging In',
      name: 'msgLogin',
      desc: '',
      args: [],
    );
  }

  /// `Logging Out`
  String get msgLogout {
    return Intl.message(
      'Logging Out',
      name: 'msgLogout',
      desc: '',
      args: [],
    );
  }

  /// `Fetching Data`
  String get msgFetchData {
    return Intl.message(
      'Fetching Data',
      name: 'msgFetchData',
      desc: '',
      args: [],
    );
  }

  /// `Login Failed, please try again`
  String get msgLoginFailed {
    return Intl.message(
      'Login Failed, please try again',
      name: 'msgLoginFailed',
      desc: '',
      args: [],
    );
  }

  /// `Failed to get socials`
  String get msgSocialFail {
    return Intl.message(
      'Failed to get socials',
      name: 'msgSocialFail',
      desc: '',
      args: [],
    );
  }

  /// `You might also like`
  String get msgLike {
    return Intl.message(
      'You might also like',
      name: 'msgLike',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
