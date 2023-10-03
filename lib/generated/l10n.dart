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

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Courses`
  String get courses {
    return Intl.message(
      'Courses',
      name: 'courses',
      desc: '',
      args: [],
    );
  }

  /// `Chat`
  String get chat {
    return Intl.message(
      'Chat',
      name: 'chat',
      desc: '',
      args: [],
    );
  }

  /// `Account`
  String get account {
    return Intl.message(
      'Account',
      name: 'account',
      desc: '',
      args: [],
    );
  }

  /// `Hi`
  String get hi {
    return Intl.message(
      'Hi',
      name: 'hi',
      desc: '',
      args: [],
    );
  }

  /// `Let's start learning`
  String get letstartlearning {
    return Intl.message(
      'Let\'s start learning',
      name: 'letstartlearning',
      desc: '',
      args: [],
    );
  }

  /// `What do you want to learn today ?`
  String get whatdouwanttolearntoday {
    return Intl.message(
      'What do you want to learn today ?',
      name: 'whatdouwanttolearntoday',
      desc: '',
      args: [],
    );
  }

  /// `Get Started`
  String get getstarted {
    return Intl.message(
      'Get Started',
      name: 'getstarted',
      desc: '',
      args: [],
    );
  }

  /// `Learning Plan`
  String get learningplan {
    return Intl.message(
      'Learning Plan',
      name: 'learningplan',
      desc: '',
      args: [],
    );
  }

  /// `Meetup`
  String get meetup {
    return Intl.message(
      'Meetup',
      name: 'meetup',
      desc: '',
      args: [],
    );
  }

  /// `Off-line exchange of learning experience`
  String get offline_exchange {
    return Intl.message(
      'Off-line exchange of learning experience',
      name: 'offline_exchange',
      desc: '',
      args: [],
    );
  }

  /// `Notifications`
  String get notifications {
    return Intl.message(
      'Notifications',
      name: 'notifications',
      desc: '',
      args: [],
    );
  }

  /// `notification`
  String get notification {
    return Intl.message(
      'notification',
      name: 'notification',
      desc: '',
      args: [],
    );
  }

  /// `message`
  String get message {
    return Intl.message(
      'message',
      name: 'message',
      desc: '',
      args: [],
    );
  }

  /// `Courses`
  String get course {
    return Intl.message(
      'Courses',
      name: 'course',
      desc: '',
      args: [],
    );
  }

  /// `All Courses`
  String get allcourses {
    return Intl.message(
      'All Courses',
      name: 'allcourses',
      desc: '',
      args: [],
    );
  }

  /// `My Courses`
  String get mycourses {
    return Intl.message(
      'My Courses',
      name: 'mycourses',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `Painting`
  String get painting {
    return Intl.message(
      'Painting',
      name: 'painting',
      desc: '',
      args: [],
    );
  }

  /// `Choose Your Course`
  String get choose_your_course {
    return Intl.message(
      'Choose Your Course',
      name: 'choose_your_course',
      desc: '',
      args: [],
    );
  }

  /// `Learned Today`
  String get learned_today {
    return Intl.message(
      'Learned Today',
      name: 'learned_today',
      desc: '',
      args: [],
    );
  }

  /// `All`
  String get all {
    return Intl.message(
      'All',
      name: 'all',
      desc: '',
      args: [],
    );
  }

  /// `Popular`
  String get popular {
    return Intl.message(
      'Popular',
      name: 'popular',
      desc: '',
      args: [],
    );
  }

  /// `New`
  String get neew {
    return Intl.message(
      'New',
      name: 'neew',
      desc: '',
      args: [],
    );
  }

  /// `Completed`
  String get completed {
    return Intl.message(
      'Completed',
      name: 'completed',
      desc: '',
      args: [],
    );
  }

  /// `Do you Want to edit your information ?`
  String get question {
    return Intl.message(
      'Do you Want to edit your information ?',
      name: 'question',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get yes {
    return Intl.message(
      'Yes',
      name: 'yes',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get no {
    return Intl.message(
      'No',
      name: 'no',
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
      Locale.fromSubtags(languageCode: 'ar'),
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
