import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'de', 'sv'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? deText = '',
    String? svText = '',
  }) =>
      [enText, deText, svText][languageIndex] ?? '';
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // SignIn
  {
    'tqptr2q1': {
      'en': 'Post a task',
      'de': 'Poste eine Aufgabe',
      'sv': 'L??gg upp en uppgift',
    },
    'xaldde76': {
      'en': 'Welcome back!',
      'de': 'Willkommen zur??ck!',
      'sv': 'V??lkommen tillbaka!',
    },
    'd7uczo3s': {
      'en': 'Sign in to your account',
      'de': 'Melden Sie sich bei Ihrem Konto an',
      'sv': 'logga in p?? ditt konto',
    },
    'sf4bx4u9': {
      'en': 'Log in to your account!',
      'de': 'Melde dich in deinem Konto an!',
      'sv': 'Logga in p?? ditt konto!',
    },
    'noc91n9r': {
      'en': 'E-mail address ',
      'de': 'E-Mail-Addresse',
      'sv': 'E-postadress',
    },
    'cdwr3wul': {
      'en': 'Password',
      'de': 'Passwort',
      'sv': 'L??senord',
    },
    'ia2nqle2': {
      'en': 'Keep me logged in',
      'de': 'Eingeloggt bleiben',
      'sv': 'H??ll mig inloggad',
    },
    'bkdq7p6f': {
      'en': 'Log-in',
      'de': 'Anmeldung',
      'sv': 'Logga in',
    },
    'j4zrgmlk': {
      'en': 'Forgot password? Click',
      'de': 'Passwort vergessen? Klicken',
      'sv': 'Gl??mt ditt l??senord? Klick',
    },
    'daxvmlaf': {
      'en': '----------  Or log-in with  ----------',
      'de': '---------- Oder melden Sie sich mit ---------- an',
      'sv': '---------- Eller logga in med ----------',
    },
    'ctzal91g': {
      'en': 'Facebook',
      'de': 'Facebook',
      'sv': 'Facebook',
    },
    '34jjhsjy': {
      'en': 'Gmail',
      'de': 'Gmail',
      'sv': 'Gmail',
    },
    'k7770xy0': {
      'en': '<   Back',
      'de': '< Zur??ck',
      'sv': '< Tillbaka',
    },
    'otriezcw': {
      'en': 'Don\'t have an account ?',
      'de': 'Sie haben kein Konto?',
      'sv': 'Har du inget konto?',
    },
    '87z8mnsf': {
      'en': 'Register',
      'de': 'Registrieren',
      'sv': 'Registrera',
    },
    '6i6zbxy2': {
      'en': 'Home',
      'de': 'Zuhause',
      'sv': 'Hem',
    },
  },
  // SignUp
  {
    'dvbwh33k': {
      'en': 'Hello, friend!',
      'de': 'Hallo Freund!',
      'sv': 'Hej kompis!',
    },
    '77aobf76': {
      'en': 'Create your account',
      'de': 'Erstelle deinen Account',
      'sv': 'Skapa ditt konto',
    },
    '8b34kf5l': {
      'en': 'Create an account It???s Free!',
      'de': 'Erstellen Sie ein Konto Es ist kostenlos!',
      'sv': 'Skapa ett konto Det ??r gratis!',
    },
    'ynqead8j': {
      'en': 'E-mail address ',
      'de': 'E-Mail-Addresse',
      'sv': 'E-postadress',
    },
    'pymo11gg': {
      'en': 'Password',
      'de': 'Passwort',
      'sv': 'L??senord',
    },
    'zazj8t9y': {
      'en': 'Confirm Password',
      'de': 'Kennwort best??tigen',
      'sv': 'Bekr??fta l??senord',
    },
    'j8f2tkxl': {
      'en': 'Sign up',
      'de': 'Anmelden',
      'sv': 'Bli Medlem',
    },
    'uybmtnkv': {
      'en': 'By clicking \"Sign up\", you agree to',
      'de': 'Indem Sie auf ???Anmelden??? klicken, stimmen Sie zu',
      'sv': 'Genom att klicka p?? \"Registrera dig\" godk??nner du',
    },
    'h3iuc9s6': {
      'en': 'terms of service',
      'de': '',
      'sv': '',
    },
    'snx9ww5u': {
      'en': 'and',
      'de': 'und',
      'sv': 'och',
    },
    'quz05ysn': {
      'en': 'Privacy Policy',
      'de': '',
      'sv': '',
    },
    '18zdpvgx': {
      'en': '----------  Or log-in with  ----------',
      'de': '---------- Oder melden Sie sich mit ---------- an',
      'sv': '---------- Eller logga in med ----------',
    },
    '4kfa0kik': {
      'en': 'Facebook',
      'de': 'Facebook',
      'sv': 'Facebook',
    },
    'd1u88krp': {
      'en': 'Gmail',
      'de': 'Gmail',
      'sv': 'Gmail',
    },
    'nhptebrs': {
      'en': 'Have an account?  ',
      'de': 'Ein Konto haben?',
      'sv': 'Har ett konto?',
    },
    'ck6gb80y': {
      'en': 'Log-in',
      'de': 'Anmeldung',
      'sv': 'Logga in',
    },
    'b86vkdyk': {
      'en': 'Home',
      'de': 'Zuhause',
      'sv': 'Hem',
    },
  },
  // ForgotPassword
  {
    '05rbjbr0': {
      'en': 'Post a task',
      'de': 'Poste eine Aufgabe',
      'sv': 'L??gg upp en uppgift',
    },
    '8i4qfsu0': {
      'en': 'Enter your email address!',
      'de': 'Geben sie ihre E-Mailadresse ein!',
      'sv': 'Skriv in din mailadress!',
    },
    'ki4jo3os': {
      'en': 'E-mail address ',
      'de': 'E-Mail-Addresse',
      'sv': 'E-postadress',
    },
    'q7mbk113': {
      'en': '<   Back',
      'de': '< Zur??ck',
      'sv': '< Tillbaka',
    },
    'iyzzvm9s': {
      'en': 'Send link',
      'de': 'Link senden',
      'sv': 'Skicka l??nk',
    },
    '0qfjj7uj': {
      'en': 'Home',
      'de': 'Zuhause',
      'sv': 'Hem',
    },
  },
  // NewPassword
  {
    '37npd67i': {
      'en': 'Post a task',
      'de': 'Poste eine Aufgabe',
      'sv': 'L??gg upp en uppgift',
    },
    'vhq7kt96': {
      'en': 'Enter your new password',
      'de': 'Gib dein neues Passwort ein',
      'sv': 'Ange ditt nya l??senord',
    },
    'nk6lnuq2': {
      'en': 'Enter New Password',
      'de': 'Neues Passwort eingeben',
      'sv': 'Ange nytt l??senord',
    },
    'tdn799go': {
      'en': 'Confirm New Password',
      'de': 'Best??tige neues Passwort',
      'sv': 'Bekr??fta nytt l??senord',
    },
    '85b1naa0': {
      'en': '<   Back',
      'de': '< Zur??ck',
      'sv': '< Tillbaka',
    },
    'jdejepb6': {
      'en': 'Done',
      'de': 'Erledigt',
      'sv': 'Gjort',
    },
    'o4bw2sw0': {
      'en': 'Home',
      'de': 'Zuhause',
      'sv': 'Hem',
    },
  },
  // ChooseLanguage
  {
    'ypww9l9l': {
      'en': 'Post a task',
      'de': 'Poste eine Aufgabe',
      'sv': 'L??gg upp en uppgift',
    },
    'qcsc8xmn': {
      'en': 'Select your country and language',
      'de': 'W??hlen Sie Ihr Land und Ihre Sprache aus',
      'sv': 'V??lj ditt land och spr??k',
    },
    'z2eldsiq': {
      'en': 'Select Countries',
      'de': 'L??nder ausw??hlen',
      'sv': 'V??lj L??nder',
    },
    'm16fjte6': {
      'en': 'Select Language',
      'de': 'Sprache ausw??hlen',
      'sv': 'V??lj spr??k',
    },
    'hjmnr227': {
      'en': 'Next   >',
      'de': 'Weiter >',
      'sv': 'N??sta >',
    },
    'x3u77gla': {
      'en': 'Home',
      'de': 'Zuhause',
      'sv': 'Hem',
    },
  },
  // KnowU
  {
    'rwqv6dcl': {
      'en': 'Post a task',
      'de': 'Poste eine Aufgabe',
      'sv': 'L??gg upp en uppgift',
    },
    '0tmr38is': {
      'en': 'Let us know more about you!',
      'de': 'Lass uns mehr ??ber dich wissen!',
      'sv': 'L??t oss veta mer om dig!',
    },
    'xkfs5glh': {
      'en': 'Account type',
      'de': 'Konto Typ',
      'sv': 'Kontotyp',
    },
    'h4kq3r8r': {
      'en': 'Private',
      'de': 'Privatgel??nde',
      'sv': 'Privat',
    },
    'cawtxbx6': {
      'en': 'Company',
      'de': 'Unternehmen',
      'sv': 'F??retag',
    },
    'xj3eo1yo': {
      'en': 'Title',
      'de': 'Titel',
      'sv': 'Titel',
    },
    '68ctanp5': {
      'en': 'Mrs',
      'de': 'Frau',
      'sv': 'Fru',
    },
    '0sb0rjet': {
      'en': 'Mr',
      'de': 'Herr',
      'sv': 'herr',
    },
    '3mqmwtmk': {
      'en': 'Company Name',
      'de': 'Name der Firma',
      'sv': 'F??retagsnamn',
    },
    'jd3lme0k': {
      'en': '',
      'de': 'Vorname',
      'sv': 'F??rnamn',
    },
    't8cpj5t0': {
      'en': 'First Name',
      'de': 'Vorname',
      'sv': 'F??rnamn',
    },
    'lynus0zd': {
      'en': '',
      'de': 'Vorname',
      'sv': 'F??rnamn',
    },
    'mgbbs3z6': {
      'en': 'Last Name',
      'de': 'Nachname',
      'sv': 'Efternamn',
    },
    '44se40kw': {
      'en': '',
      'de': 'Nachname',
      'sv': 'Efternamn',
    },
    '3rf60y9l': {
      'en': 'Country Code',
      'de': 'Landesvorwahl',
      'sv': 'Landskod',
    },
    'hnex86dg': {
      'en': 'Option 1',
      'de': 'Option 1',
      'sv': 'Alternativ 1',
    },
    'ppqfed3b': {
      'en': 'country code',
      'de': 'Landesvorwahl',
      'sv': 'landskod',
    },
    '44pigfef': {
      'en': 'Phone number',
      'de': 'Telefonnummer',
      'sv': 'Telefonnummer',
    },
    'nbpletil': {
      'en': '<   Back',
      'de': '< Zur??ck',
      'sv': '< Tillbaka',
    },
    'ifn2m4jr': {
      'en': 'Next   >',
      'de': 'Weiter >',
      'sv': 'N??sta >',
    },
    'e96hq98w': {
      'en': 'Home',
      'de': 'Zuhause',
      'sv': 'Hem',
    },
  },
  // CONTACTDATA2-M-144
  {
    'mmfkyucd': {
      'en': 'Please add your addresses',
      'de': 'Bitte f??gen Sie Ihre Adressen hinzu',
      'sv': 'V??nligen l??gg till dina adresser',
    },
    '6nuvp82w': {
      'en': 'Choose your location',
      'de': 'W??hle deinen Standort',
      'sv': 'V??lj din plats',
    },
    'hh2mueh0': {
      'en': 'Select Location',
      'de': 'Ort ausw??hlen',
      'sv': 'V??lj plats',
    },
    'lec3c22u': {
      'en': 'Street ',
      'de': 'Stra??e',
      'sv': 'Gata',
    },
    '2gsrrdhr': {
      'en': 'No',
      'de': 'Nein',
      'sv': 'Nej',
    },
    'qy1u3yc4': {
      'en': 'Postal Code',
      'de': 'Postleitzahl',
      'sv': 'postnummer',
    },
    'db0thmmm': {
      'en': 'City',
      'de': 'Stadt',
      'sv': 'Stad',
    },
    'u545mrv0': {
      'en': 'State',
      'de': 'Zustand',
      'sv': 'stat',
    },
    'dhnyndyo': {
      'en': 'Country',
      'de': 'Land',
      'sv': 'Land',
    },
    'y6w0otjc': {
      'en': 'I\'ll do it later',
      'de': 'Ich werde es sp??ter machen',
      'sv': 'jag g??r det senare',
    },
    '3ich3myr': {
      'en': '+Add',
      'de': '+Hinzuf??gen',
      'sv': '+L??gg till',
    },
    '5kild8c7': {
      'en': 'Home',
      'de': 'Zuhause',
      'sv': 'Hem',
    },
  },
  // CONTACTDATA2-M-145
  {
    'le5cl6g3': {
      'en': 'Main address',
      'de': 'Hauptadresse',
      'sv': 'Huvudadress',
    },
    'z33vh65q': {
      'en': 'Other addresses',
      'de': 'Andere Adressen',
      'sv': 'Andra adresser',
    },
    'yil9lu03': {
      'en': 'Set to main',
      'de': 'Auf Haupt stellen',
      'sv': 'St??ll in p?? main',
    },
    'dfwn5p5w': {
      'en': '+ Add another addresses',
      'de': '+ F??gen Sie weitere Adressen hinzu',
      'sv': '+ L??gg till ytterligare adresser',
    },
    'w7swi2of': {
      'en': 'Next   >',
      'de': 'Weiter >',
      'sv': 'N??sta >',
    },
    'h94mm6d7': {
      'en': 'Home',
      'de': 'Zuhause',
      'sv': 'Hem',
    },
  },
  // WhatAreYouInterestedIn
  {
    'lmk15l8f': {
      'en': 'Post a task',
      'de': 'Poste eine Aufgabe',
      'sv': 'L??gg upp en uppgift',
    },
    'f9zdwu7v': {
      'en': 'What are you intersted in!',
      'de': 'Was interessiert Sie?',
      'sv': 'Vad ??r du intresserad av!',
    },
    'n7cufqle': {
      'en': '<   Back',
      'de': '< Zur??ck',
      'sv': '< Tillbaka',
    },
    '1aaij7pe': {
      'en': 'Next   >',
      'de': 'Weiter >',
      'sv': 'N??sta >',
    },
    '57e9dskx': {
      'en': 'Home',
      'de': 'Zuhause',
      'sv': 'Hem',
    },
  },
  // Skills
  {
    'j8n1jdg0': {
      'en': 'Post a task',
      'de': 'Poste eine Aufgabe',
      'sv': 'L??gg upp en uppgift',
    },
    'xodkiggv': {
      'en': 'Skills',
      'de': 'Kompetenzen',
      'sv': 'Kompetens',
    },
    'sz9k1qr1': {
      'en': '1',
      'de': '1',
      'sv': '1',
    },
    'p5ax3lkj': {
      'en': 'Skills :',
      'de': 'Kompetenzen :',
      'sv': 'Kompetens :',
    },
    'osqhbn1t': {
      'en': 'Skill level :',
      'de': 'F??higkeits Level :',
      'sv': 'Skicklighetsniv?? :',
    },
    'f837egbz': {
      'en': 'Instruments :',
      'de': 'Instrumente :',
      'sv': 'Instrument:',
    },
    'uqmmtx1r': {
      'en': 'Violin',
      'de': 'Geige',
      'sv': 'Fiol',
    },
    'w11ec5iy': {
      'en': '+ Add another Skills',
      'de': '+ F??gen Sie weitere F??higkeiten hinzu',
      'sv': '+ L??gg till ytterligare f??rdigheter',
    },
    'v8x1e9j2': {
      'en': 'Messaging',
      'de': 'Nachrichten',
      'sv': 'Meddelanden',
    },
  },
  // ProfileView
  {
    '6whbk7tb': {
      'en': 'Member Number: ',
      'de': 'Mitgliedsnummer:',
      'sv': 'Medlemsnummer:',
    },
    'kvm2l1uc': {
      'en': '581521513',
      'de': '581521513',
      'sv': '581521513',
    },
    'v8srpybz': {
      'en': 'Member Since: ',
      'de': 'Mitglied seit:',
      'sv': 'Medlem sedan:',
    },
    'semgjiw9': {
      'en': '2019/05/08',
      'de': '08.05.2019',
      'sv': '2019/05/08',
    },
    '1h925kdg': {
      'en': 'Upgrade to premium',
      'de': 'Auf Premium upgraden',
      'sv': 'Uppgradera till Premium',
    },
    'n8xo72x3': {
      'en': 'Profile',
      'de': 'Profil',
      'sv': 'Profil',
    },
    'tmbvkxar': {
      'en': 'Contact Data',
      'de': 'Kontaktdaten',
      'sv': 'Kontaktinformation',
    },
    'q9chy7i5': {
      'en': 'Skills',
      'de': 'Kompetenzen',
      'sv': 'Kompetens',
    },
    '9swx5x2b': {
      'en': 'Identification',
      'de': 'Identifikation',
      'sv': 'Identifiering',
    },
    'xk97cur7': {
      'en': 'Education',
      'de': 'Ausbildung',
      'sv': 'Utbildning',
    },
    '76ktlt3x': {
      'en': 'My tasks',
      'de': 'Meine Aufgaben',
      'sv': 'Mina uppgifter',
    },
    '0f0acxg5': {
      'en': 'Rates',
      'de': 'Preise',
      'sv': 'Priser',
    },
    'hsdallhf': {
      'en': 'My Visit Card',
      'de': 'Meine Visitenkarte',
      'sv': 'Mitt visitkort',
    },
    'gzi76dm3': {
      'en': 'Plans & Prices',
      'de': 'Pl??ne & Preise',
      'sv': 'Planer och priser',
    },
    '1wqpsmhk': {
      'en': 'How its work',
      'de': 'Wie es funktioniert',
      'sv': 'Hur det fungerar',
    },
    'm780cinq': {
      'en': 'Category',
      'de': 'Kategorie',
      'sv': 'Kategori',
    },
    'c9p2jlmv': {
      'en': 'Search task',
      'de': 'Aufgabe suchen',
      'sv': 'S??k uppgift',
    },
    'khe9px14': {
      'en': 'Search tasker',
      'de': 'Tasker suchen',
      'sv': 'S??k tasker',
    },
    '1utx15ke': {
      'en': 'language',
      'de': 'Sprache',
      'sv': 'spr??k',
    },
    'i6hvqunz': {
      'en': 'Privacy setting',
      'de': 'Privatsph??reeinstellung',
      'sv': 'Privata inst??llningar',
    },
    'viujow54': {
      'en': 'Log out',
      'de': 'Ausloggen',
      'sv': 'Logga ut',
    },
    'madq6h2m': {
      'en': 'Profile',
      'de': 'Profil',
      'sv': 'Profil',
    },
  },
  // Details1-M-152
  {
    '07nh23tp': {
      'en': 'Post a task',
      'de': 'Poste eine Aufgabe',
      'sv': 'L??gg upp en uppgift',
    },
    '4oh2td8i': {
      'en': 'Years of Experience',
      'de': 'Langj??hrige Erfahrung',
      'sv': '??r av erfarenhet',
    },
    'v4nezniz': {
      'en': '',
      'de': '[Einige Hinweistexte...]',
      'sv': '[N??gon tipstext...]',
    },
    'wxszp0xa': {
      'en': 'Languages ',
      'de': 'Sprachen',
      'sv': 'spr??k',
    },
    'il0qz1ro': {
      'en': 'Option 1',
      'de': 'Option 1',
      'sv': 'Alternativ 1',
    },
    '1m1op34r': {
      'en': 'Insurance',
      'de': 'Versicherung',
      'sv': 'F??rs??kring',
    },
    '9wx8xsjl': {
      'en': 'Driver???s license',
      'de': 'F??hrerschein',
      'sv': 'K??rkort',
    },
    '9bfo6mxv': {
      'en': 'Car',
      'de': 'Auto',
      'sv': 'Bil',
    },
    'cm8ye29s': {
      'en': 'Truck',
      'de': 'Lastwagen',
      'sv': 'Lastbil',
    },
    'e64zq649': {
      'en': 'I\'ll do it later',
      'de': 'Ich werde es sp??ter machen',
      'sv': 'jag g??r det senare',
    },
    'ymxjhbwe': {
      'en': 'Save',
      'de': 'Speichern',
      'sv': 'Spara',
    },
    'cxqmruti': {
      'en': 'Home',
      'de': 'Zuhause',
      'sv': 'Hem',
    },
  },
  // Details2-M-153
  {
    'ks4f5kzh': {
      'en': 'Post a task',
      'de': 'Poste eine Aufgabe',
      'sv': 'L??gg upp en uppgift',
    },
    '6qeq31gn': {
      'en': 'Registration Number',
      'de': 'Registrationsnummer',
      'sv': 'Registreringsnummer',
    },
    '1u0px2pd': {
      'en': '[Some hint text...]',
      'de': '[Einige Hinweistexte...]',
      'sv': '[N??gon tipstext...]',
    },
    '97e4mafp': {
      'en': 'City of registration',
      'de': 'Stadt der Registrierung',
      'sv': 'Registreringsstad',
    },
    'kfr9ykqt': {
      'en': '[Some hint text...]',
      'de': '[Einige Hinweistexte...]',
      'sv': '[N??gon tipstext...]',
    },
    'pnwcan5j': {
      'en': 'Date of registration',
      'de': 'Datum der Registrierung',
      'sv': 'Registreringsdatum',
    },
    '9snhfz79': {
      'en': 'DD',
      'de': 'DD',
      'sv': 'DD',
    },
    '08kpgv2a': {
      'en': 'MM',
      'de': 'MM',
      'sv': 'MM',
    },
    'sri3w9z6': {
      'en': 'YYYY',
      'de': 'JJJJ',
      'sv': '????????',
    },
    'rsblo7gb': {
      'en': 'Number of Employees ',
      'de': 'Anzahl der Angestellten',
      'sv': 'antal anst??llda',
    },
    'h3hoxi9t': {
      'en': '< 10',
      'de': '< 10',
      'sv': '< 10',
    },
    'vhvha17r': {
      'en': '10-50',
      'de': '10-50',
      'sv': '10-50',
    },
    'g21wi987': {
      'en': '51-100',
      'de': '51-100',
      'sv': '51-100',
    },
    'f27hie26': {
      'en': '100 >',
      'de': '100 >',
      'sv': '100 >',
    },
    'jt5tj6ed': {
      'en': 'Describe your self',
      'de': 'Beschreibe dich selbst',
      'sv': 'Beskriv dig sj??lv',
    },
    'sl62tsst': {
      'en': '[Some hint text...]',
      'de': '[Einige Hinweistexte...]',
      'sv': '[N??gon tipstext...]',
    },
    '6h6kokqu': {
      'en': 'I\'ll do it later',
      'de': 'Ich werde es sp??ter machen',
      'sv': 'jag g??r det senare',
    },
    '8ljhuwll': {
      'en': 'Save',
      'de': 'Speichern',
      'sv': 'Spara',
    },
    'zrow8ghg': {
      'en': 'Home',
      'de': 'Zuhause',
      'sv': 'Hem',
    },
  },
  // TASK-M-197
  {
    'cnr2lzaq': {
      'en': 'Enter price',
      'de': 'Preis eingeben',
      'sv': 'Ange pris',
    },
    '2ws93qng': {
      'en': 'One package amount',
      'de': 'Eine Paketmenge',
      'sv': 'Ett paketbelopp',
    },
    'betvl50m': {
      'en': 'Offer a rate',
      'de': 'Bieten Sie einen Preis an',
      'sv': 'Erbjud ett pris',
    },
    '0ur0f1dz': {
      'en': 'How much',
      'de': 'Wie viel',
      'sv': 'Hur mycket',
    },
    'equq0mjl': {
      'en': 'Currency',
      'de': 'W??hrung',
      'sv': 'Valuta',
    },
    'n4sk4pbm': {
      'en': '24',
      'de': '24',
      'sv': '24',
    },
    'n6phdbac': {
      'en': '???',
      'de': '???',
      'sv': '???',
    },
    'y4u6ku5t': {
      'en': 'Per hour',
      'de': 'Pro Stunde',
      'sv': 'Per timme',
    },
    'b19eraa0': {
      'en': 'Home',
      'de': 'Zuhause',
      'sv': 'Hem',
    },
  },
  // TASK-M-198
  {
    'qe3liu74': {
      'en': 'Select your task',
      'de': 'W??hlen Sie Ihre Aufgabe aus',
      'sv': 'V??lj din uppgift',
    },
    't2fd0lwi': {
      'en': 'Home',
      'de': 'Zuhause',
      'sv': 'Hem',
    },
  },
  // TASK-M-200
  {
    'd0kgwxjf': {
      'en': 'Select your task',
      'de': 'W??hlen Sie Ihre Aufgabe aus',
      'sv': 'V??lj din uppgift',
    },
    '0oxdhntf': {
      'en': 'Translation',
      'de': '??bersetzung',
      'sv': '??vers??ttning',
    },
    '18553ff0': {
      'en': 'Language Teaching',
      'de': 'Sprache lehren',
      'sv': 'Spr??kundervisning',
    },
    '8dwn6as7': {
      'en': 'Skill level',
      'de': 'F??higkeits Level',
      'sv': 'Skicklighetsniv??',
    },
    'sbhnb0f9': {
      'en': 'Educated Professional',
      'de': 'Gebildeter Fachmann',
      'sv': 'Utbildad proffs',
    },
    'jy85nnw8': {
      'en': 'Experienced Self-Trained',
      'de': 'Erfahrener Autodidakt',
      'sv': 'Erfaren sj??lvutbildad',
    },
    'ad4w9md1': {
      'en': ' Self trained ',
      'de': 'Selbst ausgebildet',
      'sv': 'Sj??lvutbildad',
    },
    'fxbw1p0u': {
      'en': 'Languages ',
      'de': 'Sprachen',
      'sv': 'spr??k',
    },
    '81bzxi9p': {
      'en': 'Description',
      'de': 'Beschreibung',
      'sv': 'Beskrivning',
    },
    '1raf60nw': {
      'en': 'Change file',
      'de': 'Datei ??ndern',
      'sv': 'Byt fil',
    },
    '3j6fjvul': {
      'en': 'Discard',
      'de': 'Verwerfen',
      'sv': 'Kassera',
    },
    'b6zgi2q2': {
      'en': 'Save changes',
      'de': '??nderungen speichern',
      'sv': 'Spara ??ndringar',
    },
    '7h87t2ky': {
      'en': 'Home',
      'de': 'Zuhause',
      'sv': 'Hem',
    },
  },
  // CONTACTDATA2-M-221
  {
    'dflvsy5c': {
      'en': 'Please add your addresses',
      'de': 'Bitte f??gen Sie Ihre Adressen hinzu',
      'sv': 'V??nligen l??gg till dina adresser',
    },
    'sf3t7ydg': {
      'en': 'Enter your address, postal code or city',
      'de': 'Geben Sie Ihre Adresse, Postleitzahl oder Stadt ein',
      'sv': 'Ange din adress, postnummer eller stad',
    },
    '8uwyd9lq': {
      'en': 'Konrad-Adenauer-Allee 1144263 ',
      'de': 'Konrad-Adenauer-Allee 1144263',
      'sv': 'Konrad-Adenauer-Allee 1144263',
    },
    'h2arbti7': {
      'en': 'Street',
      'de': 'Stra??e',
      'sv': 'Gata',
    },
    'e8x5f8mt': {
      'en': 'No',
      'de': 'Nein',
      'sv': 'Nej',
    },
    'ta9czcsl': {
      'en': 'Konrad-Adenau',
      'de': 'Konrad Adenau',
      'sv': 'Konrad-Adenau',
    },
    'n2h2vjdw': {
      'en': '11',
      'de': '11',
      'sv': '11',
    },
    'kon2ttoa': {
      'en': 'Postal Code',
      'de': 'Postleitzahl',
      'sv': 'postnummer',
    },
    'xwoc5l0p': {
      'en': 'City',
      'de': 'Stadt',
      'sv': 'Stad',
    },
    '02gchrg6': {
      'en': '4263263365',
      'de': '4263263365',
      'sv': '4263263365',
    },
    'btd3r01e': {
      'en': 'Dortmund',
      'de': 'Dortmund',
      'sv': 'Dortmund',
    },
    'q24xu0id': {
      'en': 'Country',
      'de': 'Land',
      'sv': 'Land',
    },
    '3ecbc392': {
      'en': 'Germany',
      'de': 'Deutschland',
      'sv': 'Tyskland',
    },
    'q0xh87ca': {
      'en': 'Discard',
      'de': 'Verwerfen',
      'sv': 'Kassera',
    },
    'mdt3sg5n': {
      'en': 'Save changes',
      'de': '??nderungen speichern',
      'sv': 'Spara ??ndringar',
    },
    'lka1i7ji': {
      'en': 'Home',
      'de': 'Zuhause',
      'sv': 'Hem',
    },
  },
  // CONTACTDATA2-M-202
  {
    '3ii58dmb': {
      'en': 'Please add your addresses',
      'de': 'Bitte f??gen Sie Ihre Adressen hinzu',
      'sv': 'V??nligen l??gg till dina adresser',
    },
    '96fvuqku': {
      'en': 'Select from my addresses',
      'de': 'W??hlen Sie aus meinen Adressen aus',
      'sv': 'V??lj bland mina adresser',
    },
    'les53l5s': {
      'en': 'Or enter different address',
      'de': 'Oder geben Sie eine andere Adresse ein',
      'sv': 'Eller ange en annan adress',
    },
    'sxe2hryz': {
      'en': 'Discard',
      'de': 'Verwerfen',
      'sv': 'Kassera',
    },
    '6h11rowu': {
      'en': 'Next > ',
      'de': 'Weiter >',
      'sv': 'N??sta >',
    },
    '5qve5b0y': {
      'en': 'Home',
      'de': 'Zuhause',
      'sv': 'Hem',
    },
  },
  // Calnendar-M-203
  {
    'ywfffx2s': {
      'en': 'Select task\'s time',
      'de': 'W??hlen Sie die Zeit der Aufgabe aus',
      'sv': 'V??lj uppgiftens tid',
    },
    '4vxei20m': {
      'en': 'Exact Dates',
      'de': 'Genaue Daten',
      'sv': 'Exakta datum',
    },
    '8rg1c6ze': {
      'en': 'Weekly',
      'de': 'W??chentlich',
      'sv': 'Varje vecka',
    },
    '7jy2vubg': {
      'en': 'Monthly',
      'de': 'Monatlich',
      'sv': 'En g??ng i m??naden',
    },
    'n8shrpzk': {
      'en': '<   Back',
      'de': '< Zur??ck',
      'sv': '< Tillbaka',
    },
    '7ojqmt5i': {
      'en': 'Next   >',
      'de': 'Weiter >',
      'sv': 'N??sta >',
    },
    '8mpovah6': {
      'en': 'Home',
      'de': 'Zuhause',
      'sv': 'Hem',
    },
  },
  // Calnendar-M-205
  {
    'vu7kkf95': {
      'en': 'Select task\'s time',
      'de': 'W??hlen Sie die Zeit der Aufgabe aus',
      'sv': 'V??lj uppgiftens tid',
    },
    '8hsh6vt0': {
      'en': 'Select date',
      'de': 'Datum ausw??hlen',
      'sv': 'V??lj datum',
    },
    'pslorj6m': {
      'en': 'Starting time',
      'de': 'Anfangszeit',
      'sv': 'Starttid',
    },
    '2cwxr5k6': {
      'en': 'Morning (7:00 - 12:00)',
      'de': 'Morgen (7:00 - 12:00)',
      'sv': 'Morgon (7:00 - 12:00)',
    },
    '11lut168': {
      'en': 'Evening (18:00 ; 24:00)',
      'de': 'Abend (18:00 ; 24:00)',
      'sv': 'Kv??ll (18:00; 24:00)',
    },
    '3srpxltq': {
      'en': 'Afternoon (12:00-18:00)',
      'de': 'Nachmittag (12:00-18:00)',
      'sv': 'Eftermiddag (12:00-18:00)',
    },
    '8729904t': {
      'en': 'I have exact starting time',
      'de': 'Ich habe genaue Startzeit',
      'sv': 'Jag har exakt starttid',
    },
    '3dp3lz8v': {
      'en': 'Number of hours per day ',
      'de': 'Stundenzahl pro Tag',
      'sv': 'Antal timmar per dag',
    },
    'q2ru560s': {
      'en': '<   Back',
      'de': '< Zur??ck',
      'sv': '< Tillbaka',
    },
    'xb6xb35g': {
      'en': 'Next   >',
      'de': 'Weiter >',
      'sv': 'N??sta >',
    },
    'ruog90o1': {
      'en': 'Home',
      'de': 'Zuhause',
      'sv': 'Hem',
    },
  },
  // Calnendar-M-208
  {
    '7s6wzjfl': {
      'en': 'Select task\'s time',
      'de': 'W??hlen Sie die Zeit der Aufgabe aus',
      'sv': 'V??lj uppgiftens tid',
    },
    '3uuqnejq': {
      'en': 'From',
      'de': 'Von',
      'sv': 'Fr??n',
    },
    'bu3o014x': {
      'en': 'To',
      'de': 'Zu',
      'sv': 'Till',
    },
    'c3td8rjc': {
      'en': 'Days per week',
      'de': 'Tage pro Woche',
      'sv': 'Dagar i veckan',
    },
    'aqc0hu1h': {
      'en': 'Hour each session',
      'de': 'Stunde jede Sitzung',
      'sv': 'Timme varje session',
    },
    'mpscdwpz': {
      'en': 'Morning (7:00 - 12:00)',
      'de': 'Morgen (7:00 - 12:00)',
      'sv': 'Morgon (7:00 - 12:00)',
    },
    'dlvg3yuh': {
      'en': 'Evening (18:00 ; 24:00)',
      'de': 'Abend (18:00 ; 24:00)',
      'sv': 'Kv??ll (18:00; 24:00)',
    },
    'qwddz1xp': {
      'en': 'Afternoon (12:00-18:00)',
      'de': 'Nachmittag (12:00-18:00)',
      'sv': 'Eftermiddag (12:00-18:00)',
    },
    'j274gduj': {
      'en': 'Preferred days',
      'de': 'Bevorzugte Tage',
      'sv': 'F??redragna dagar',
    },
    '61dl3i3o': {
      'en': 'Mondays',
      'de': 'montags',
      'sv': 'm??ndagar',
    },
    'htgvo0k3': {
      'en': 'Tuesdays',
      'de': 'Dienstags',
      'sv': 'tisdagar',
    },
    'its5tvf0': {
      'en': 'Wednsdays',
      'de': 'Mittwochs',
      'sv': 'Onsdagar',
    },
    'fkc5dkdx': {
      'en': 'Thursdays',
      'de': 'donnerstags',
      'sv': 'torsdagar',
    },
    '29tkm9q1': {
      'en': 'Fridays',
      'de': 'Freitags',
      'sv': 'fredagar',
    },
    't3539zk1': {
      'en': 'Sundays',
      'de': 'Sonntage',
      'sv': 's??ndagar',
    },
    'eypstf8u': {
      'en': 'saturday',
      'de': '',
      'sv': '',
    },
    'mf4490xk': {
      'en': '<   Back',
      'de': '< Zur??ck',
      'sv': '< Tillbaka',
    },
    '1ts14e0x': {
      'en': 'Next   >',
      'de': 'Weiter >',
      'sv': 'N??sta >',
    },
    'enggectg': {
      'en': 'Home',
      'de': 'Zuhause',
      'sv': 'Hem',
    },
  },
  // Taskerdetails-M-215
  {
    '6e7gi4fp': {
      'en': 'Tasker type',
      'de': 'Tasker-Typ',
      'sv': 'Tasker typ',
    },
    'xltsaoz0': {
      'en': 'Tasker gender',
      'de': 'Tasker-Geschlecht',
      'sv': 'Tasker k??n',
    },
    '9al7saux': {
      'en': 'Male',
      'de': 'M??nnlich',
      'sv': 'Manlig',
    },
    'lgxur0kg': {
      'en': 'Female',
      'de': 'Weiblich',
      'sv': 'Kvinna',
    },
    'o664j19o': {
      'en': 'Doesn\'t matter',
      'de': 'Egal',
      'sv': 'spelar ingen roll',
    },
    'sd76t2jh': {
      'en': 'Tasker age',
      'de': 'Tasker-Alter',
      'sv': 'Tasker ??lder',
    },
    'ys251dq2': {
      'en': '<20',
      'de': '<20',
      'sv': '<20',
    },
    'zleu6pmw': {
      'en': '20-40',
      'de': '20-40',
      'sv': '20-40',
    },
    'k9th9ex0': {
      'en': '40>',
      'de': '40>',
      'sv': '40>',
    },
    '6hjzea81': {
      'en': 'Doesn\'t matter',
      'de': 'Egal',
      'sv': 'spelar ingen roll',
    },
    'wbow2tvc': {
      'en': 'Identified',
      'de': 'Identifiziert',
      'sv': 'Identifierad',
    },
    'hod7pci9': {
      'en': 'PUBLISH TASK',
      'de': 'AUFGABE VER??FFENTLICHEN',
      'sv': 'PUBLICERA UPPGIFT',
    },
    'higimudu': {
      'en': 'Next >',
      'de': 'Weiter >',
      'sv': 'N??sta >',
    },
    '4p9dincj': {
      'en': 'Home',
      'de': 'Zuhause',
      'sv': 'Hem',
    },
  },
  // Taskerdetails-M-217
  {
    '6tf9rro5': {
      'en': 'Tasker type',
      'de': 'Tasker-Typ',
      'sv': 'Tasker typ',
    },
    'nlzukjz7': {
      'en': 'Years of Experience',
      'de': 'Langj??hrige Erfahrung',
      'sv': '??r av erfarenhet',
    },
    'mnzxw4zj': {
      'en': 'Languages ',
      'de': 'Sprachen',
      'sv': 'spr??k',
    },
    '6nm0imjk': {
      'en': 'Option 1',
      'de': 'Option 1',
      'sv': 'Alternativ 1',
    },
    'g3e8e1s7': {
      'en': 'Insurance',
      'de': 'Versicherung',
      'sv': 'F??rs??kring',
    },
    '7rh1lng8': {
      'en': 'Driver???s license',
      'de': 'F??hrerschein',
      'sv': 'K??rkort',
    },
    '7dgwh2h9': {
      'en': 'Car',
      'de': 'Auto',
      'sv': 'Bil',
    },
    'ecm9dx5s': {
      'en': 'Truck',
      'de': 'Lastwagen',
      'sv': 'Lastbil',
    },
    'y3g4p4ip': {
      'en': '<   Back',
      'de': '< Zur??ck',
      'sv': '< Tillbaka',
    },
    '6n5x6zif': {
      'en': 'Next   >',
      'de': 'Weiter >',
      'sv': 'N??sta >',
    },
    '6s0hu890': {
      'en': 'Home',
      'de': 'Zuhause',
      'sv': 'Hem',
    },
  },
  // Taskerdetails-M-218
  {
    'snmhbz8s': {
      'en': 'Tasker type',
      'de': 'Tasker-Typ',
      'sv': 'Tasker typ',
    },
    'ty8yc85q': {
      'en': 'Max Tasker distance with my address in ',
      'de': 'Max. Tasker-Entfernung mit meiner Adresse',
      'sv': 'Max Tasker avst??nd med min adress in',
    },
    'lq6qq93o': {
      'en': 'I Pay travel costs',
      'de': 'Fahrtkosten bezahle ich',
      'sv': 'Jag betalar resekostnader',
    },
    'f9te3uem': {
      'en': 'How much',
      'de': 'Wie viel',
      'sv': 'Hur mycket',
    },
    'q7eirugd': {
      'en': 'Currency',
      'de': 'W??hrung',
      'sv': 'Valuta',
    },
    'byr72u65': {
      'en': '24',
      'de': '24',
      'sv': '24',
    },
    '0va7bwmp': {
      'en': '???',
      'de': '???',
      'sv': '???',
    },
    'q74xqjaq': {
      'en': 'Per hour',
      'de': 'Pro Stunde',
      'sv': 'Per timme',
    },
    '6rzruthz': {
      'en': 'Cancellation Penalty Applies',
      'de': 'Es f??llt eine Stornogeb??hr an',
      'sv': 'Avbokningsstraff g??ller',
    },
    'zr6drwh3': {
      'en': 'How much',
      'de': 'Wie viel',
      'sv': 'Hur mycket',
    },
    'mtyo5347': {
      'en': 'Currency',
      'de': 'W??hrung',
      'sv': 'Valuta',
    },
    '5l9lv1tb': {
      'en': '24',
      'de': '24',
      'sv': '24',
    },
    'abuqm4e8': {
      'en': '???',
      'de': '???',
      'sv': '???',
    },
    'k303cwi5': {
      'en': 'Per hour',
      'de': 'Pro Stunde',
      'sv': 'Per timme',
    },
    'hyeno3gn': {
      'en': 'If cancelled before due date later than',
      'de': 'Bei Stornierung vor F??lligkeit sp??ter als',
      'sv': 'Vid avbokning f??re f??rfallodatum senare ??n',
    },
    'xkolqlip': {
      'en': 'Coming Soon!',
      'de': 'Demn??chst!',
      'sv': 'Kommer snart!',
    },
    'pidy9zcd': {
      'en': '<   Back',
      'de': '< Zur??ck',
      'sv': '< Tillbaka',
    },
    '1tr5m4sr': {
      'en': 'Next   >',
      'de': 'Weiter >',
      'sv': 'N??sta >',
    },
    'gucfy8s5': {
      'en': 'Home',
      'de': 'Zuhause',
      'sv': 'Hem',
    },
  },
  // search-M-12
  {
    'qxohdt1z': {
      'en': 'Location',
      'de': 'Standort',
      'sv': 'Plats',
    },
    'h8hbbrry': {
      'en': 'Any',
      'de': 'Irgendein',
      'sv': 'N??gra',
    },
    'pvi435ex': {
      'en': 'My address',
      'de': '',
      'sv': '',
    },
    'vxjmstzh': {
      'en': 'Enter your Location, City or Zipcode',
      'de': '',
      'sv': '',
    },
    '2co3o69l': {
      'en': 'Select Location',
      'de': 'Ort ausw??hlen',
      'sv': 'V??lj plats',
    },
    'zh6wa1mv': {
      'en': 'Distance',
      'de': 'Distanz',
      'sv': 'Distans',
    },
    't2l1tsol': {
      'en': 'km',
      'de': 'km',
      'sv': 'km',
    },
    '6p8kuuso': {
      'en': '10              30                 50                100',
      'de': '10 30 50 100',
      'sv': '10 30 50 100',
    },
    'n7i5t7j0': {
      'en': 'Category',
      'de': 'Kategorie',
      'sv': 'Kategori',
    },
    'daql7k99': {
      'en': 'Gardening',
      'de': 'Gartenarbeit',
      'sv': 'Tr??dg??rdsarbete',
    },
    'lm8calbu': {
      'en': 'Handwork',
      'de': 'Handarbeit',
      'sv': 'Handarbete',
    },
    '716rm206': {
      'en': 'Housekeeping',
      'de': 'Haushaltsf??hrung',
      'sv': 'Hush??llning',
    },
    'oblmo1i0': {
      'en': 'Senior care',
      'de': 'Seniorenbetreuung',
      'sv': '??ldrev??rd',
    },
    'zqtdfq7n': {
      'en': 'Party & Event',
      'de': 'Party & Veranstaltung',
      'sv': 'Fest & Event',
    },
    'jnbcbrys': {
      'en': 'Music',
      'de': 'Musik',
      'sv': 'musik',
    },
    'mgh5pqv5': {
      'en': 'Computer & IT',
      'de': 'Computer & IT',
      'sv': 'Dator & IT',
    },
    'vsz9xt4y': {
      'en': 'Haircut & Beauty',
      'de': 'Haarschnitt & Sch??nheit',
      'sv': 'Frisyr & Sk??nhet',
    },
    'ue3xmdan': {
      'en': 'Languages',
      'de': 'Sprachen',
      'sv': 'spr??k',
    },
    'hxfeodge': {
      'en': 'Taeching',
      'de': 'Taeching',
      'sv': 'Undervisning',
    },
    '1tpusr82': {
      'en': 'Therapy - Nursing',
      'de': 'Therapie - Pflege',
      'sv': 'Terapi - Omv??rdnad',
    },
    'ukpl1y84': {
      'en': 'Cook & Catering',
      'de': 'Koch & Gastronomie',
      'sv': 'Kock & Catering',
    },
    'byhebbof': {
      'en': 'Relocation',
      'de': 'Verlegung',
      'sv': 'Omlokalisering',
    },
    'dowkmvvq': {
      'en': 'Pet-Sitting',
      'de': 'Haustierbetreuung',
      'sv': 'Husdjursvakt',
    },
    'i3esazd4': {
      'en': 'Entertainment',
      'de': 'Unterhaltung',
      'sv': 'Underh??llning',
    },
    '4fx1jjpq': {
      'en': 'Options',
      'de': 'Optionen',
      'sv': 'alternativ',
    },
    '9pprjgi2': {
      'en': 'Skills',
      'de': 'Kompetenzen',
      'sv': 'Kompetens',
    },
    'xkmg7b8z': {
      'en': 'Garden Care ',
      'de': 'Gartenpflege',
      'sv': 'Tr??dg??rdsv??rd',
    },
    '878nwelq': {
      'en': 'Garden Construction ',
      'de': 'Gartenbau',
      'sv': 'Tr??dg??rdskonstruktion',
    },
    'rmq06f5y': {
      'en': 'Planting',
      'de': 'Pflanzen',
      'sv': 'Plantering',
    },
    'ch932b65': {
      'en': 'Skill level',
      'de': 'F??higkeits Level',
      'sv': 'Skicklighetsniv??',
    },
    'vsy2gg0m': {
      'en': 'Hello World',
      'de': '',
      'sv': '',
    },
    '7ew3q51g': {
      'en': 'Brings own tools',
      'de': 'Bringt eigenes Werkzeug mit',
      'sv': 'Tar med egna verktyg',
    },
    'na73wser': {
      'en': 'Buys material',
      'de': 'Kauft Material',
      'sv': 'K??per material',
    },
    'a2vr0etx': {
      'en': 'Date',
      'de': 'Datum',
      'sv': 'Datum',
    },
    'xtfdbdar': {
      'en': 'Any',
      'de': 'Irgendein',
      'sv': 'N??gra',
    },
    'nxexj1by': {
      'en': 'From',
      'de': 'Von',
      'sv': 'Fr??n',
    },
    'umcfh2j7': {
      'en': 'To',
      'de': 'Zu',
      'sv': 'Till',
    },
    'h5b1nhz3': {
      'en': '20th Dec 2018',
      'de': '20. Dezember 2018',
      'sv': '20 december 2018',
    },
    '9afwv37f': {
      'en': '20th Dec 2018',
      'de': '20. Dezember 2018',
      'sv': '20 december 2018',
    },
    'y8rkidl6': {
      'en': 'Price',
      'de': 'Preis',
      'sv': 'Pris',
    },
    'xupwebcp': {
      'en': 'Any',
      'de': 'Irgendein',
      'sv': 'N??gra',
    },
    's2rqzzry': {
      'en': 'Hourly rate',
      'de': 'Stundensatz',
      'sv': 'Timtaxa',
    },
    'awrtixkb': {
      'en': 'From',
      'de': 'Von',
      'sv': 'Fr??n',
    },
    'cfd54qux': {
      'en': 'To',
      'de': 'Zu',
      'sv': 'Till',
    },
    '4cqh1ki0': {
      'en': '???',
      'de': '???',
      'sv': '???',
    },
    '34vto9nx': {
      'en': '\$',
      'de': '\$',
      'sv': '\$',
    },
    'l4h9b0fp': {
      'en': 'Total Amount',
      'de': 'Gesamtmenge',
      'sv': 'Totala summan',
    },
    '5fsopmz1': {
      'en': 'Top rates first',
      'de': 'Top-Preise zuerst',
      'sv': 'H??gsta priser f??rst',
    },
    'nxsyokb4': {
      'en': 'Tasker type',
      'de': 'Tasker-Typ',
      'sv': 'Tasker typ',
    },
    'm38j2d7d': {
      'en': 'Any',
      'de': 'Irgendein',
      'sv': 'N??gra',
    },
    'we4ix3fv': {
      'en': 'male',
      'de': 'm??nnlich',
      'sv': 'manlig',
    },
    'c9ihbez5': {
      'en': 'Female',
      'de': 'Weiblich',
      'sv': 'Kvinna',
    },
    'zs6b5ced': {
      'en': 'Tasker age',
      'de': 'Tasker-Alter',
      'sv': 'Tasker ??lder',
    },
    's0sd5n4r': {
      'en': 'Total Amount',
      'de': 'Gesamtmenge',
      'sv': 'Totala summan',
    },
    '8fcym56n': {
      'en': '<20',
      'de': '<20',
      'sv': '<20',
    },
    '655nluh0': {
      'en': '20-40',
      'de': '20-40',
      'sv': '20-40',
    },
    '9r8c3kdr': {
      'en': '40>',
      'de': '40>',
      'sv': '40>',
    },
    'urz565m8': {
      'en': 'Language',
      'de': 'Sprache',
      'sv': 'Spr??k',
    },
    'b5rs776e': {
      'en': 'Selec language',
      'de': 'Sprache w??hlen',
      'sv': 'V??lj spr??k',
    },
    'pgz4j6tp': {
      'en': 'Identified',
      'de': 'Identifiziert',
      'sv': 'Identifierad',
    },
    'xkakgusv': {
      'en': 'Insured',
      'de': 'Versichert',
      'sv': 'F??rs??krad',
    },
    '75hmn961': {
      'en': 'Driver???s license',
      'de': 'F??hrerschein',
      'sv': 'K??rkort',
    },
    '31urg2bx': {
      'en': 'Car',
      'de': 'Auto',
      'sv': 'Bil',
    },
    '8dyc70lt': {
      'en': 'Truck',
      'de': 'Lastwagen',
      'sv': 'Lastbil',
    },
    'p9agqwhh': {
      'en': 'Apply Filters',
      'de': 'Filter anwenden',
      'sv': 'Anv??nd filter',
    },
    'vuph8w8d': {
      'en': 'Clear',
      'de': 'Klar',
      'sv': 'Klar',
    },
    'qkvhmpg4': {
      'en': 'Home',
      'de': 'Zuhause',
      'sv': 'Hem',
    },
  },
  // MyNetwork
  {
    'wpyrsm79': {
      'en': 'Post a task',
      'de': 'Poste eine Aufgabe',
      'sv': 'L??gg upp en uppgift',
    },
    'e8g0jqqy': {
      'en': 'My Network',
      'de': 'Mein Netzwerk',
      'sv': 'Mitt n??tverk',
    },
  },
  // Describe-M-150
  {
    '05khreae': {
      'en': 'Post a task',
      'de': 'Poste eine Aufgabe',
      'sv': 'L??gg upp en uppgift',
    },
    'w4jnlm2l': {
      'en': 'Baby-sitting',
      'de': 'Babysitting',
      'sv': 'Barnpassning',
    },
    'o4y4yjin': {
      'en': 'Got a few boxes to shift, an apartment or \nentire house',
      'de':
          'Habe ein paar Kisten zu verschieben, eine Wohnung bzw\nganzes Haus',
      'sv': 'Fick n??gra l??dor att flytta, en l??genhet eller\nhela huset',
    },
    'wxinae7b': {
      'en': 'Baby-sittingXXXXXXX',
      'de': 'BabysittingXXXXXXX',
      'sv': 'BarnvaktXXXXXXX',
    },
    '3x6pp8n7': {
      'en': 'Infants Sitting ',
      'de': 'Kleinkinder sitzen',
      'sv': 'Sitter f??r sp??dbarn',
    },
    '8taywb8o': {
      'en': 'Kids Sitting ',
      'de': 'Kinder sitzen',
      'sv': 'Barn som sitter',
    },
    'lslw772v': {
      'en': 'Midwife Care ',
      'de': 'Hebammenbetreuung',
      'sv': 'Barnmorskev??rd',
    },
    'j3kwii31': {
      'en': 'Choose a category to get Started:',
      'de': 'W??hlen Sie eine Kategorie, um loszulegen:',
      'sv': 'V??lj en kategori f??r att komma ig??ng:',
    },
    '0nxqi7cu': {
      'en': 'Gardening',
      'de': 'Gartenarbeit',
      'sv': 'Tr??dg??rdsarbete',
    },
    'hy245v3r': {
      'en': 'Handwork',
      'de': 'Handarbeit',
      'sv': 'Handarbete',
    },
    'a61f92ea': {
      'en': 'Housekeeping',
      'de': 'Haushaltsf??hrung',
      'sv': 'Hush??llning',
    },
    '4xregjhs': {
      'en': 'Senior care',
      'de': 'Seniorenbetreuung',
      'sv': '??ldrev??rd',
    },
    '0qsj637u': {
      'en': 'Party & Event',
      'de': 'Party & Veranstaltung',
      'sv': 'Fest & Event',
    },
    '9ora2jq9': {
      'en': 'Music',
      'de': 'Musik',
      'sv': 'musik',
    },
    'gj5yv3v7': {
      'en': 'Computer & IT',
      'de': 'Computer & IT',
      'sv': 'Dator & IT',
    },
    'a7va0k1v': {
      'en': 'Haircut & Beauty',
      'de': 'Haarschnitt & Sch??nheit',
      'sv': 'Frisyr & Sk??nhet',
    },
    '93ftuarl': {
      'en': 'Languages',
      'de': 'Sprachen',
      'sv': 'spr??k',
    },
    'hdoia7wq': {
      'en': 'Taeching',
      'de': 'Taeching',
      'sv': 'Undervisning',
    },
    '4yoj72m0': {
      'en': 'Therapy-Nursing',
      'de': 'Therapie-Pflege',
      'sv': 'Terapi-omv??rdnad',
    },
    'xe4k6lt9': {
      'en': 'Cook & Catering',
      'de': 'Koch & Gastronomie',
      'sv': 'Kock & Catering',
    },
    'ijbyqjyn': {
      'en': 'Relocation',
      'de': 'Verlegung',
      'sv': 'Omlokalisering',
    },
    'vfp5rxs8': {
      'en': 'Pet-Sitting',
      'de': 'Haustierbetreuung',
      'sv': 'Husdjursvakt',
    },
    '2v8ys0nl': {
      'en': 'Entertainment',
      'de': 'Unterhaltung',
      'sv': 'Underh??llning',
    },
    'two2spr3': {
      'en': 'Search tasks',
      'de': 'Aufgaben suchen',
      'sv': 'S??k uppgifter',
    },
    'w8dr138d': {
      'en': 'Search taskers',
      'de': 'Tasker suchen',
      'sv': 'S??k arbetstagare',
    },
    '9ve6df4y': {
      'en': 'Describe your self',
      'de': 'Beschreibe dich selbst',
      'sv': 'Beskriv dig sj??lv',
    },
    'w4h2wuix': {
      'en': '[Some hint text...]',
      'de': '[Einige Hinweistexte...]',
      'sv': '[N??gon tipstext...]',
    },
    '7d28kslc': {
      'en': 'I\'ll do it later',
      'de': 'Ich werde es sp??ter machen',
      'sv': 'jag g??r det senare',
    },
    'n6gkk6i9': {
      'en': 'Save',
      'de': 'Speichern',
      'sv': 'Spara',
    },
    'ix969iit': {
      'en': 'Home',
      'de': 'Zuhause',
      'sv': 'Hem',
    },
  },
  // Calender
  {
    '1lnc07p3': {
      'en': 'Post a task',
      'de': 'Poste eine Aufgabe',
      'sv': 'L??gg upp en uppgift',
    },
    'opbmmzcm': {
      'en': 'Calender',
      'de': 'Kalander',
      'sv': 'Kalender',
    },
  },
  // Profile
  {
    'j11iy9u7': {
      'en': 'Post a task',
      'de': 'Poste eine Aufgabe',
      'sv': 'L??gg upp en uppgift',
    },
    '1y0n0ute': {
      'en': 'Profile',
      'de': 'Kontaktdaten',
      'sv': 'Kontaktinformation',
    },
    'lo9klty4': {
      'en': 'Profile completed',
      'de': 'Konto Typ:',
      'sv': 'Kontotyp:',
    },
    'alqm7yjp': {
      'en': 'Account type:',
      'de': 'Konto Typ:',
      'sv': 'Kontotyp:',
    },
    'ygkruw9b': {
      'en': 'Name :',
      'de': 'Name :',
      'sv': 'Namn :',
    },
    'nzcefohn': {
      'en': 'Date of birthday :',
      'de': 'Geburtsdatum :',
      'sv': 'F??delsedatum :',
    },
    '6u9dpo93': {
      'en': 'Email address : ',
      'de': 'E-Mail-Addresse :',
      'sv': 'E-postadress :',
    },
    'iy1k1st9': {
      'en': 'Password :',
      'de': 'Passwort :',
      'sv': 'L??senord :',
    },
    'axdy0ngo': {
      'en': 'xxxxxxxx',
      'de': 'xxxxxxx',
      'sv': 'xxxxxxxx',
    },
    'vfajfx5v': {
      'en': 'Text',
      'de': 'Text',
      'sv': 'Text',
    },
    '6zthc5yu': {
      'en': 'Member Ship Type :',
      'de': 'Art der Mitgliedschaft :',
      'sv': 'Typ av medlemskap :',
    },
    'zk7vrkw0': {
      'en': 'Free',
      'de': 'Frei',
      'sv': 'Fri',
    },
    'zb0ji072': {
      'en': 'Upgrade',
      'de': 'Aktualisierung',
      'sv': 'Uppgradera',
    },
    'r8qerc2t': {
      'en': 'Identification :',
      'de': 'Identifikation :',
      'sv': 'Identifiering :',
    },
    'm1lcoedb': {
      'en': 'No',
      'de': 'Nein',
      'sv': 'Nej',
    },
    'pyq3ya5e': {
      'en': 'Online Identification',
      'de': 'Online-Identifizierung',
      'sv': 'Online identifiering',
    },
    '7hh1rxzw': {
      'en': 'Profile',
      'de': 'Profil',
      'sv': 'Profil',
    },
  },
  // ContactData
  {
    'p6dun3t1': {
      'en': 'Post a task',
      'de': 'Poste eine Aufgabe',
      'sv': 'L??gg upp en uppgift',
    },
    'gd0fhlar': {
      'en': 'Contact data',
      'de': 'Kontaktdaten',
      'sv': 'Kontaktinformation',
    },
    'v3vfpyw6': {
      'en': 'Email address :',
      'de': 'E-Mail-Addresse :',
      'sv': 'E-postadress :',
    },
    '34a8bdwa': {
      'en': 'katrinsmith@gmail.com',
      'de': 'katrinsmith@gmail.com',
      'sv': 'katrinsmith@gmail.com',
    },
    'wk553cb6': {
      'en': 'Password :',
      'de': 'Passwort :',
      'sv': 'L??senord :',
    },
    'akegfdqe': {
      'en': 'xxxxxxxx',
      'de': 'xxxxxxx',
      'sv': 'xxxxxxxx',
    },
    'pi0iq4y8': {
      'en': 'Mobile numbe : ',
      'de': 'Handynummer :',
      'sv': 'Mobilnummer:',
    },
    'l4skrrb5': {
      'en': '(+49) 941 56 26 569',
      'de': '(+49) 941 56 26 569',
      'sv': '(+49) 941 56 26 569',
    },
    'cv30xeeq': {
      'en': 'Addresses',
      'de': 'Adressen',
      'sv': 'Adresser',
    },
    'i9jl4l27': {
      'en': 'Konrad-Adenauer-Allee \n1144263 Dortmund, Germany',
      'de': 'Konrad-Adenauer-Allee\n1144263 Dortmund, Deutschland',
      'sv': 'Konrad-Adenauer-Allee\n1144263 Dortmund, Tyskland',
    },
    'j581jmql': {
      'en': 'Main address',
      'de': 'Hauptadresse',
      'sv': 'Huvudadress',
    },
    '61vu3pag': {
      'en': 'Konrad-Adenauer-Allee 1144263 Dortmund,\nGermany',
      'de': 'Konrad-Adenauer-Allee 1144263 Dortmund,\nDeutschland',
      'sv': 'Konrad-Adenauer-Allee 1144263 Dortmund,\nTyskland',
    },
    'txgco6vb': {
      'en': '+ Add another addresses',
      'de': '+ F??gen Sie weitere Adressen hinzu',
      'sv': '+ L??gg till ytterligare adresser',
    },
    'qm4atkip': {
      'en': 'Identification :',
      'de': 'Identifikation :',
      'sv': 'Identifiering :',
    },
    'av0g64w2': {
      'en': 'No',
      'de': 'Nein',
      'sv': 'Nej',
    },
    's4dj6tgr': {
      'en': 'Online Identification',
      'de': 'Online-Identifizierung',
      'sv': 'Online identifiering',
    },
    '053o8j5x': {
      'en': 'Connect to :',
      'de': 'Verbunden mit :',
      'sv': 'Koppla till :',
    },
    'radpss1u': {
      'en': 'Messaging',
      'de': 'Nachrichten',
      'sv': 'Meddelanden',
    },
  },
  // homePage-M-03
  {
    'byefalip': {
      'en': 'Register',
      'de': '',
      'sv': '',
    },
    'na7fnwdx': {
      'en': 'Log-in',
      'de': '',
      'sv': '',
    },
    'psoc5dn1': {
      'en': 'Post a task',
      'de': 'Poste eine Aufgabe',
      'sv': 'L??gg upp en uppgift',
    },
    'e70v09bv': {
      'en': 'Discover your talents!',
      'de': 'Entdecken Sie Ihre Talente!',
      'sv': 'Uppt??ck dina talanger!',
    },
    'clzvl14a': {
      'en': 'Earn money from your skills\nand hobbies.',
      'de': 'Verdienen Sie Geld mit Ihren F??higkeiten\nund Hobbys.',
      'sv': 'Tj??na pengar p?? dina kunskaper\noch hobbyer.',
    },
    'mwyze2g3': {
      'en': 'Become a tasker',
      'de': 'Werde Taskler',
      'sv': 'Bli en tasker',
    },
    'ok8zboec': {
      'en': 'Choose a categories to get Started:',
      'de': 'W??hlen Sie eine Kategorie aus, um loszulegen:',
      'sv': 'V??lj en kategori f??r att komma ig??ng:',
    },
    '9ludutge': {
      'en': 'How it works?',
      'de': 'Wie es funktioniert?',
      'sv': 'Hur det fungerar?',
    },
    '6rf98zv8': {
      'en': 'Post your task',
      'de': 'Poste deine Aufgabe',
      'sv': 'L??gg upp din uppgift',
    },
    'ugt88hy8': {
      'en':
          'Create a task in less than 1 minute\nSelect among options\nDefine budget and date\nDefine conditions\nPost it',
      'de':
          'Erstellen Sie eine Aufgabe in weniger als 1 Minute\nW??hlen Sie unter den Optionen aus\nDefinieren Sie Budget und Datum\nBedingungen definieren\nVer??ffentliche es',
      'sv':
          'Skapa en uppgift p?? mindre ??n 1 minut\nV??lj bland alternativ\nDefiniera budget och datum\nDefiniera villkor\nPosta det',
    },
    '0ak2a89i': {
      'en': 'Make the deal',
      'de': 'Machen Sie den Deal',
      'sv': 'G??r aff??ren',
    },
    'avnzqy61': {
      'en': 'Taskers will review and apply\nReview their profile',
      'de': 'Tasker pr??fen und bewerben sich\n??berpr??fen Sie ihr Profil',
      'sv': 'Arbetsgivare kommer att granska och ans??ka\nGranska deras profil',
    },
    'od2tg1v9': {
      'en': 'Post your task',
      'de': 'Poste deine Aufgabe',
      'sv': 'L??gg upp din uppgift',
    },
    'p3dacvcq': {
      'en': 'Confirm a tasker\nTasker will reconfirm\nYou have a deal',
      'de':
          'Best??tigen Sie einen Tasker\nTasker wird es erneut best??tigen\nSie haben eine Abmachung',
      'sv':
          'Bekr??fta en uppdragsgivare\nTasker kommer att bekr??fta igen\nDu har ett avtal',
    },
    'tt7yw188': {
      'en': 'Choose the offering that \nworks best for you',
      'de': 'W??hlen Sie das Angebot, das\nfunktioniert am besten f??r dich',
      'sv': 'V??lj det erbjudande som\nfungerar b??st f??r dig',
    },
    'ajzohrfa': {
      'en':
          'All Options include access to \ntasker.page talent pool of top-quality\nfreelancers and agencies',
      'de':
          'Alle Optionen beinhalten den Zugriff auf\ntasker.page Talentpool von h??chster Qualit??t\nFreiberufler und Agenturen',
      'sv':
          'Alla alternativ inkluderar tillg??ng till\ntasker.page talangpool av h??gsta kvalitet\nfrilansare och byr??er',
    },
    'syzncc69': {
      'en': 'Standard',
      'de': 'Standard',
      'sv': 'Standard',
    },
    '54szuwzb': {
      'en': 'Create a strong profile of all talents\nyou have!\n',
      'de':
          'Erstellen Sie ein aussagekr??ftiges Profil aller Talente\nSie haben!',
      'sv': 'Skapa en stark profil av alla talanger\ndu har!',
    },
    'vff99bwr': {
      'en': 'Post tasks and bid on other task \nunder one single account!\n',
      'de':
          'Erstellen Sie ein aussagekr??ftiges Profil aller Talente\nSie haben!',
      'sv': 'Skapa en stark profil av alla talanger\ndu har!',
    },
    't164bzqa': {
      'en': 'Free',
      'de': 'Frei',
      'sv': 'Fri',
    },
    'nmc8bowd': {
      'en': 'Select Standard',
      'de': 'W??hlen Sie Standard',
      'sv': 'V??lj Standard',
    },
    'hd0q9r8u': {
      'en': 'See feature  >',
      'de': 'Siehe Funktion >',
      'sv': 'Se funktion >',
    },
    'hazu8rym': {
      'en': 'BEST VALUE',
      'de': 'BESTER WERT',
      'sv': 'B??STA V??RDE',
    },
    'zzirze78': {
      'en': 'Premium',
      'de': 'Pr??mie',
      'sv': 'Premie',
    },
    '1cym7lhm': {
      'en': 'Search people and get connected \nand work together! \n',
      'de':
          'Suchen Sie nach Personen und verbinden Sie sich\nund zusammenarbeiten!',
      'sv': 'S??k efter m??nniskor och bli ansluten\noch jobba tillsammans!',
    },
    '7wmy85u7': {
      'en':
          'Post tasks and get things done with \nno limit and no additional cost!\n',
      'de':
          'Ver??ffentliche Aufgaben und erledige Dinge\nkein Limit und keine zus??tzlichen Kosten!',
      'sv':
          'L??gg upp uppgifter och f?? saker gjorda med\ningen gr??ns och ingen extra kostnad!',
    },
    'tie0dqh3': {
      'en': 'from',
      'de': 'von',
      'sv': 'fr??n',
    },
    'oxl3db3c': {
      'en': '9,90',
      'de': '9,90',
      'sv': '9,90',
    },
    'yjnullsf': {
      'en': '???',
      'de': '???',
      'sv': '???',
    },
    'lc73tebu': {
      'en': '/ month',
      'de': '/ Monat',
      'sv': '/ m??nad',
    },
    'fbktbhsa': {
      'en': 'from',
      'de': 'von',
      'sv': 'fr??n',
    },
    'cgt5y49p': {
      'en': ' 11,90 ',
      'de': '11,90',
      'sv': '11,90',
    },
    '43ye2tvt': {
      'en': '------',
      'de': '',
      'sv': '',
    },
    'fbujfxbu': {
      'en': '???',
      'de': '???',
      'sv': '???',
    },
    'nrdp71sa': {
      'en': '/ month',
      'de': '/ Monat',
      'sv': '/ m??nad',
    },
    'r1b1trqj': {
      'en': 'Select Premium',
      'de': 'W??hlen Sie Premium aus',
      'sv': 'V??lj Premium',
    },
    'mzd3nyy0': {
      'en': 'See feature  >',
      'de': 'Siehe Funktion >',
      'sv': 'Se funktion >',
    },
    'hyjgtv50': {
      'en': 'Enterprice',
      'de': 'Unternehmen',
      'sv': 'F??retagspris',
    },
    '8yhdiot7': {
      'en': 'Present your company with minimal \ncost!\n',
      'de': 'Pr??sentieren Sie Ihr Unternehmen mit minimalem Aufwand\nkosten!',
      'sv': 'Presentera ditt f??retag med minimal\nkosta!',
    },
    'wop7atmg': {
      'en': 'Get access to hundreds of \nopportunities!\n',
      'de': 'Erhalten Sie Zugriff auf Hunderte von\nGelegenheiten!',
      'sv': 'F?? tillg??ng till hundratals\nm??jligheter!',
    },
    'lbijkz94': {
      'en': 'from',
      'de': 'von',
      'sv': 'fr??n',
    },
    'v62tdkyz': {
      'en': '29,90',
      'de': '29,90',
      'sv': '29,90',
    },
    'mklhadci': {
      'en': '???',
      'de': '???',
      'sv': '???',
    },
    'ykgfgssf': {
      'en': '/ month',
      'de': '/ Monat',
      'sv': '/ m??nad',
    },
    'a64t6prf': {
      'en': 'Select Enterprice',
      'de': 'W??hlen Sie Enterprise-Preis aus',
      'sv': 'V??lj F??retagspris',
    },
    '6v3b5763': {
      'en': 'See feature  >',
      'de': 'Siehe Funktion >',
      'sv': 'Se funktion >',
    },
    '0d2xjanb': {
      'en': 'See what others are \ngetting done',
      'de': 'Sehen Sie, was andere sind\nfertig werden',
      'sv': 'Se vad andra ??r\nbli klar',
    },
    'i2elal07': {
      'en': 'See what others are getting done',
      'de': 'Sehen Sie, was andere erledigen',
      'sv': 'Se vad andra g??r',
    },
    'fvj79tgf': {
      'en': 'TOP DEAL',
      'de': 'TOP ANGEBOT',
      'sv': 'B??STA ERBJUDANDE',
    },
    'gwkvhrlm': {
      'en': 'Open',
      'de': 'Offen',
      'sv': '??ppen',
    },
    'ngxq9x3a': {
      'en': 'Weekly',
      'de': 'W??chentlich',
      'sv': 'Varje vecka',
    },
    'mh6dejyr': {
      'en': 'Move Boxes and Push\nbike Kew to Sydney...',
      'de':
          'Kisten verschieben und schieben\nMit dem Fahrrad von Kew nach Sydney...',
      'sv': 'Flytta l??dor och tryck\ncykla Kew till Sydney...',
    },
    'phdx0qiz': {
      'en': '61???',
      'de': '61???',
      'sv': '61???',
    },
    'g153bpui': {
      'en': 'per hour',
      'de': 'pro Stunde',
      'sv': 'per timme',
    },
    'rvbluu48': {
      'en': 'Choose the best person',
      'de': 'W??hlen Sie die beste Person',
      'sv': 'V??lj den b??sta personen',
    },
    'gx9e8bf4': {
      'en':
          'for you Take a look at profiles and \nreviewsto pick the best Tasker for\nyour task.  ',
      'de':
          'f??r dich Werfen Sie einen Blick auf Profile und\nBewertungen, um den besten Tasker auszuw??hlen\ndeine Aufgabe.',
      'sv':
          'f??r dig Ta en titt p?? profiler och\nrecensioner f??r att v??lja den b??sta Tasker f??r\ndin uppgift.',
    },
    'ekj9j3qk': {
      'en': 'Build your team',
      'de': 'Bauen Sie Ihr Team auf',
      'sv': 'Bygg ditt lag',
    },
    'n2oje4p6': {
      'en': 'See some taskers',
      'de': 'Siehe einige Tasker',
      'sv': 'Se n??gra taskers',
    },
    'fqbpi9or': {
      'en':
          'Discover the story behind the people that \nare making the Tasker.page \ncommunity great',
      'de':
          'Entdecken Sie die Geschichte hinter den Menschen, die\nmachen die Tasker.page\nGemeinschaft gro??artig',
      'sv':
          'Uppt??ck historien bakom m??nniskorna som\ng??r Tasker.sidan\nstor gemenskap',
    },
    'sh5zycek': {
      'en': 'TOP DEAL',
      'de': 'TOP ANGEBOT',
      'sv': 'B??STA ERBJUDANDE',
    },
    'krucxhqo': {
      'en': 'MAR 15, 2019',
      'de': '15. M??RZ 2019',
      'sv': '15 MARS 2019',
    },
    'h2ulnrdo': {
      'en': 'Open',
      'de': 'Offen',
      'sv': '??ppen',
    },
    '85wcjde0': {
      'en': 'Weekly',
      'de': 'W??chentlich',
      'sv': 'Varje vecka',
    },
    '55vm1spx': {
      'en': '',
      'de': 'Gartenarbeit |',
      'sv': 'Tr??dg??rdssk??tsel |',
    },
    '3a9aqlv4': {
      'en': 'Planting ',
      'de': 'Pflanzen',
      'sv': 'Plantering',
    },
    'hc7cstnv': {
      'en': 'Move Boxes and Push\nbike Kew to Sydney...',
      'de':
          'Kisten verschieben und schieben\nMit dem Fahrrad von Kew nach Sydney...',
      'sv': 'Flytta l??dor och tryck\ncykla Kew till Sydney...',
    },
    'tbji0oet': {
      'en': '61???',
      'de': '61???',
      'sv': '61???',
    },
    'sop1r0l5': {
      'en': 'per hour',
      'de': 'pro Stunde',
      'sv': 'per timme',
    },
    'rhbd9qdq': {
      'en': 'Dortmund | DE  ',
      'de': 'Dortmund | DE',
      'sv': 'Dortmund | DE',
    },
    '3mu2oqs3': {
      'en': 'Meet some Taskers!',
      'de': 'Treffen Sie einige Tasker!',
      'sv': 'Tr??ffa n??gra Taskers!',
    },
    '7ij4lx4t': {
      'en':
          'Discover the story behind the people that \nare making the tasker.page\ncommunity great',
      'de':
          'Entdecken Sie die Geschichte hinter den Menschen, die\nmachen die tasker.page\nGemeinschaft gro??artig',
      'sv':
          'Uppt??ck historien bakom m??nniskorna som\ng??r tasker.page\nstor gemenskap',
    },
    'gu1emgx0': {
      'en': 'I???m Katharina! a music tasker!',
      'de': 'Ich bin Katharina! ein Musiktasker!',
      'sv': 'Jag ??r Katharina! en musikarbetare!',
    },
    'nxlybmcw': {
      'en': 'I???m a music student. I can teach and \nplay guitar and Piano',
      'de':
          'Ich bin Musikstudent. Ich kann unterrichten und\nspiele Gitarre und Klavier',
      'sv':
          'Jag ??r musikstudent. Jag kan undervisa och\nspela gitarr och piano',
    },
    'zbtdh7ap': {
      'en': '45',
      'de': '45',
      'sv': '45',
    },
    'jj3l2ens': {
      'en': 'See more  >',
      'de': 'Siehe mehr >',
      'sv': 'Se mer >',
    },
    'jh0413rz': {
      'en': 'Top skills',
      'de': 'Top-F??higkeiten',
      'sv': 'Topp kompetens',
    },
    '9wzufxhp': {
      'en': 'Infants Sitting ',
      'de': 'Kleinkinder sitzen',
      'sv': 'Sitter f??r sp??dbarn',
    },
    'cf4ljarv': {
      'en': 'Kids Sitting ',
      'de': 'Kinder sitzen',
      'sv': 'Barn som sitter',
    },
    '24xpct20': {
      'en': 'Midwife Care ',
      'de': 'Hebammenbetreuung',
      'sv': 'Barnmorskev??rd',
    },
    '6l1h7wzx': {
      'en': 'Garden Care  ',
      'de': 'Gartenpflege',
      'sv': 'Tr??dg??rdsv??rd',
    },
    '1dthc2n8': {
      'en': 'Planting  ',
      'de': 'Pflanzen',
      'sv': 'Plantering',
    },
    '4hdo6mw2': {
      'en': 'Garden Construction',
      'de': 'Gartenbau',
      'sv': 'Tr??dg??rdskonstruktion',
    },
    'xk07rzy6': {
      'en': 'Electrician ',
      'de': 'Elektriker',
      'sv': 'Elektriker',
    },
    '5f5njbmp': {
      'en': 'Plumbing ',
      'de': 'Installation',
      'sv': 'VVS',
    },
    'anf3lm44': {
      'en': 'Tileing ',
      'de': 'Fliesen',
      'sv': 'Kakels??ttning',
    },
    '739jibvt': {
      'en': 'Painting ',
      'de': 'Malen',
      'sv': 'M??lning',
    },
    'p7fgxsu2': {
      'en': 'Installation ',
      'de': 'Installation',
      'sv': 'Installation',
    },
    '9nmi2uf5': {
      'en': 'Gartenbau',
      'de': 'Gartenbau',
      'sv': 'Gartenbau',
    },
    'whjn1i53': {
      'en': 'House Cleaning ',
      'de': 'Hausputz',
      'sv': 'Husst??dning',
    },
    'kw7jqk1j': {
      'en': 'Shopping service',
      'de': 'Einkaufsservice',
      'sv': 'Shoppingtj??nst',
    },
    'p3vn3kt5': {
      'en': 'Ironing service ',
      'de': 'B??gelservice',
      'sv': 'Strykservice',
    },
    '92beipof': {
      'en': 'House Cooking  ',
      'de': 'Hausmannskost',
      'sv': 'Husmatlagning',
    },
    '0hoxoeup': {
      'en': 'Elderly Nursing ',
      'de': 'Altenpflege',
      'sv': '??ldre sjuksk??terska',
    },
    'lgjrh72o': {
      'en': 'Event Catering ',
      'de': 'Event-Catering',
      'sv': 'Event Catering',
    },
    'frkj2fhr': {
      'en': 'Helper Service ',
      'de': 'Helferdienst',
      'sv': 'Hj??lpartj??nst',
    },
    '7lwrfn3c': {
      'en': 'Decoration service',
      'de': 'Dekorationsservice',
      'sv': 'Utsmyckningsservice',
    },
    'n6rdtzyi': {
      'en': 'DJ ',
      'de': 'DJ',
      'sv': 'DJ',
    },
    'uo6gzsnt': {
      'en': 'Live Music',
      'de': 'Live Musik',
      'sv': 'Live musik',
    },
    '2pj662ou': {
      'en': 'Kids-Event ',
      'de': 'Kids-Event',
      'sv': 'Barn-Event',
    },
    'gcykuw69': {
      'en': 'Comedy & Veriety ',
      'de': 'Kom??die & Wahrheit',
      'sv': 'Komedi och sanning',
    },
    '7dvqinhm': {
      'en': 'See more  ',
      'de': 'Mehr sehen',
      'sv': 'Se mer',
    },
    'cxrdw6j8': {
      'en': 'See all categories',
      'de': 'Alle Kategorien anzeigen',
      'sv': 'Se alla kategorier',
    },
    'ye7s85rw': {
      'en': 'tasker.page',
      'de': 'tasker.page',
      'sv': 'tasker.page',
    },
    'hvnxeia0': {
      'en': 'Countries',
      'de': 'L??nder',
      'sv': 'L??nder',
    },
    'dy4e8llw': {
      'en': 'Company',
      'de': 'Unternehmen',
      'sv': 'F??retag',
    },
    '0sczsq8d': {
      'en': 'Mobile app',
      'de': 'App',
      'sv': 'Mobil app',
    },
    '27icweyz': {
      'en': '?? 2015 - 2019 tasker.page?? Global Inc.',
      'de': '?? 2015 - 2019 tasker.page?? Global Inc.',
      'sv': '?? 2015 - 2019 tasker.page?? Global Inc.',
    },
    '689mhmac': {
      'en': 'Home',
      'de': 'Zuhause',
      'sv': 'Hem',
    },
  },
  // homePage-M-04
  {
    '33kct2g3': {
      'en': 'Baby-sitting',
      'de': 'Babysitting',
      'sv': 'Barnpassning',
    },
    'xgn0xrf6': {
      'en': 'Got a few boxes to shift, an apartment or \nentire house',
      'de':
          'Habe ein paar Kisten zu verschieben, eine Wohnung bzw\nganzes Haus',
      'sv': 'Fick n??gra l??dor att flytta, en l??genhet eller\nhela huset',
    },
    'qjqox91t': {
      'en': 'Baby-sittingXXXXXXX',
      'de': 'BabysittingXXXXXXX',
      'sv': 'BarnvaktXXXXXXX',
    },
    'cvilj83l': {
      'en': 'Infants Sitting ',
      'de': 'Kleinkinder sitzen',
      'sv': 'Sitter f??r sp??dbarn',
    },
    'gxkveqna': {
      'en': 'Kids Sitting ',
      'de': 'Kinder sitzen',
      'sv': 'Barn som sitter',
    },
    'gyznd08s': {
      'en': 'Midwife Care ',
      'de': 'Hebammenbetreuung',
      'sv': 'Barnmorskev??rd',
    },
    'ilfqpung': {
      'en': 'Choose a category to get Started:',
      'de': 'W??hlen Sie eine Kategorie, um loszulegen:',
      'sv': 'V??lj en kategori f??r att komma ig??ng:',
    },
    'j9ose1ad': {
      'en': 'Handwork',
      'de': 'Handarbeit',
      'sv': 'Handarbete',
    },
    '1jnsrg6k': {
      'en': 'Housekeeping',
      'de': 'Haushaltsf??hrung',
      'sv': 'Hush??llning',
    },
    'vr2veczl': {
      'en': 'Senior care',
      'de': 'Seniorenbetreuung',
      'sv': '??ldrev??rd',
    },
    'p3q40rho': {
      'en': 'Party & Event',
      'de': 'Party & Veranstaltung',
      'sv': 'Fest & Event',
    },
    '7hkzoo0t': {
      'en': 'Music',
      'de': 'Musik',
      'sv': 'musik',
    },
    'o5b6o5la': {
      'en': 'Computer & IT',
      'de': 'Computer & IT',
      'sv': 'Dator & IT',
    },
    'r4zfll1e': {
      'en': 'Haircut & Beauty',
      'de': 'Haarschnitt & Sch??nheit',
      'sv': 'Frisyr & Sk??nhet',
    },
    '8fjhu6ja': {
      'en': 'Languages',
      'de': 'Sprachen',
      'sv': 'spr??k',
    },
    'z5u8tlfp': {
      'en': 'Taeching',
      'de': 'Taeching',
      'sv': 'Undervisning',
    },
    '5ucmkyo1': {
      'en': 'Therapy-Nursing',
      'de': 'Therapie-Pflege',
      'sv': 'Terapi-omv??rdnad',
    },
    'wuucxig7': {
      'en': 'Cook & Catering',
      'de': 'Koch & Gastronomie',
      'sv': 'Kock & Catering',
    },
    'eqeifqf4': {
      'en': 'Relocation',
      'de': 'Verlegung',
      'sv': 'Omlokalisering',
    },
    '2wwww4yo': {
      'en': 'Pet-Sitting',
      'de': 'Haustierbetreuung',
      'sv': 'Husdjursvakt',
    },
    'yxb03pn3': {
      'en': 'Entertainment',
      'de': 'Unterhaltung',
      'sv': 'Underh??llning',
    },
    'rgi51tcs': {
      'en': 'Search tasks',
      'de': 'Aufgaben suchen',
      'sv': 'S??k uppgifter',
    },
    'i0fqflel': {
      'en': 'Search taskers',
      'de': 'Tasker suchen',
      'sv': 'S??k arbetstagare',
    },
    'nsurbgsj': {
      'en': 'Home',
      'de': 'Zuhause',
      'sv': 'Hem',
    },
  },
  // homePage-M-05
  {
    '5mlsxtdi': {
      'en': 'Register',
      'de': 'Registrieren',
      'sv': 'Registrera',
    },
    '8x976u3x': {
      'en': 'Log-in',
      'de': 'Anmeldung',
      'sv': 'Logga in',
    },
    '7nfx2vog': {
      'en': 'How it works',
      'de': 'Wie es funktioniert',
      'sv': 'Hur det fungerar',
    },
    'gfv9f5jz': {
      'en': 'Plans & Prices',
      'de': 'Pl??ne & Preise',
      'sv': 'Planer och priser',
    },
    'iud3ulxg': {
      'en': 'Categories',
      'de': 'Kategorien',
      'sv': 'Kategorier',
    },
    'w7igi7g6': {
      'en': 'Search tasks',
      'de': 'Aufgaben suchen',
      'sv': 'S??k uppgifter',
    },
    'k1ykhulg': {
      'en': 'Search taskers',
      'de': 'Tasker suchen',
      'sv': 'S??k arbetstagare',
    },
    'oay733hf': {
      'en': 'language',
      'de': 'Sprache',
      'sv': 'spr??k',
    },
    'j50303ob': {
      'en': 'Home',
      'de': 'Zuhause',
      'sv': 'Hem',
    },
  },
  // MyTasks
  {
    'ucajm1zp': {
      'en': 'Post a task',
      'de': 'Poste eine Aufgabe',
      'sv': 'L??gg upp en uppgift',
    },
    'np0qztcy': {
      'en': 'My task',
      'de': 'Meine Aufgabe',
      'sv': 'Min uppgift',
    },
    'vwfzg2qt': {
      'en': 'All',
      'de': 'Alles',
      'sv': 'Allt',
    },
    '1ancm2ab': {
      'en': 'Messaging',
      'de': 'Nachrichten',
      'sv': 'Meddelanden',
    },
  },
  // Skills2
  {
    'i4c3aok6': {
      'en': 'Post a task',
      'de': 'Poste eine Aufgabe',
      'sv': 'L??gg upp en uppgift',
    },
    'y59ts2my': {
      'en': 'Skills',
      'de': 'Kompetenzen',
      'sv': 'Kompetens',
    },
    'ibrhg90n': {
      'en': 'There is no skill added',
      'de': 'Keine Ausbildung eingegeben',
      'sv': 'Ingen utbildning angett',
    },
    '85v86p3e': {
      'en': 'After this time deal will expired',
      'de':
          'Das Hinzuf??gen von Ausbildungen wird zur Verbesserung beitragen\nIhr Profilranking und',
      'sv':
          'Att l??gga till utbildningar hj??lper till att f??rb??ttra\ndin profilrankning och',
    },
    '3meiqr4m': {
      'en': '+ Add Skills',
      'de': '+ F??gen Sie eine weitere Schulung oder Ausbildung hinzu',
      'sv': '+ L??gg till ytterligare en utbildning eller utbildning',
    },
    'md4jzyxr': {
      'en': 'Messaging',
      'de': 'Nachrichten',
      'sv': 'Meddelanden',
    },
  },
  // Identification
  {
    '60facxq3': {
      'en': 'Post a task',
      'de': 'Poste eine Aufgabe',
      'sv': 'L??gg upp en uppgift',
    },
    'bo55gqpa': {
      'en': 'Identification',
      'de': 'Identifikation',
      'sv': 'Identifiering',
    },
    '52tswnub': {
      'en': 'Title :',
      'de': 'Name :',
      'sv': 'Namn :',
    },
    'f5j2cg0j': {
      'en': 'Mrs',
      'de': 'Gartenmeister',
      'sv': 'Tr??dg??rdsm??stare',
    },
    'w5nwbv7e': {
      'en': 'Name :',
      'de': 'Name :',
      'sv': 'Namn :',
    },
    '7j3en8de': {
      'en': 'Katrin',
      'de': 'Gartenmeister',
      'sv': 'Tr??dg??rdsm??stare',
    },
    'lffah75n': {
      'en': 'Last name :',
      'de': 'Name :',
      'sv': 'Namn :',
    },
    '8b8x7o4n': {
      'en': 'Smith',
      'de': 'Gartenmeister',
      'sv': 'Tr??dg??rdsm??stare',
    },
    'yky2qeuj': {
      'en': 'Date of birthday  :',
      'de': 'Name :',
      'sv': 'Namn :',
    },
    'qv1kyog2': {
      'en': 'Wed, May 8, 1989',
      'de': 'Gartenmeister',
      'sv': 'Tr??dg??rdsm??stare',
    },
    'm9ss50vl': {
      'en': 'Document type :',
      'de': 'Name :',
      'sv': 'Namn :',
    },
    'nse1jqg9': {
      'en': 'Passport ',
      'de': 'Gartenmeister',
      'sv': 'Tr??dg??rdsm??stare',
    },
    'kyfosi30': {
      'en': 'Document Number :',
      'de': 'Name :',
      'sv': 'Namn :',
    },
    '1u7gr74a': {
      'en': 'XXX ',
      'de': 'Gartenmeister',
      'sv': 'Tr??dg??rdsm??stare',
    },
    '6zrp79rb': {
      'en': 'Expiry Date :',
      'de': 'Name :',
      'sv': 'Namn :',
    },
    'yfpoxupk': {
      'en': 'XXX ',
      'de': 'Gartenmeister',
      'sv': 'Tr??dg??rdsm??stare',
    },
    '7h147gep': {
      'en': 'Upload document',
      'de': 'Name :',
      'sv': 'Namn :',
    },
    'fl3j7y55': {
      'en': 'Messaging',
      'de': 'Nachrichten',
      'sv': 'Meddelanden',
    },
  },
  // Identification2
  {
    'j6yxcif6': {
      'en': 'Post a task',
      'de': 'Poste eine Aufgabe',
      'sv': 'L??gg upp en uppgift',
    },
    '5jfwe3tq': {
      'en': 'Identification',
      'de': 'Identifikation',
      'sv': 'Identifiering',
    },
    's9aco0pw': {
      'en': 'You are Not Identified YET ',
      'de': 'Sie sind noch nicht identifiziert',
      'sv': 'Du ??r inte identifierad ??NNU',
    },
    'u5uhseld': {
      'en': 'Indentification is ke to many \nposters for accepting tasks! ',
      'de':
          'Identifikation liegt vielen am Herzen\nPlakate f??r die Annahme von Aufgaben!',
      'sv':
          'Identifiering ??r viktigt f??r m??nga\naffischer f??r att ta emot uppgifter!',
    },
    '5wu99hil': {
      'en': 'DO IT NOW',
      'de': 'MACH ES JETZT',
      'sv': 'G??R DET NU',
    },
    'n2drhho0': {
      'en': 'Messaging',
      'de': 'Nachrichten',
      'sv': 'Meddelanden',
    },
  },
  // Education
  {
    'xko8dlys': {
      'en': 'Post a task',
      'de': 'Poste eine Aufgabe',
      'sv': 'L??gg upp en uppgift',
    },
    'dgltzv1l': {
      'en': 'Education',
      'de': 'Ausbildung',
      'sv': 'Utbildning',
    },
    'fsxorauu': {
      'en': 'Name :',
      'de': 'Name :',
      'sv': 'Namn :',
    },
    '5q63vzzn': {
      'en': 'Name of Institute :',
      'de': 'Name des Institutes :',
      'sv': 'Namn p?? Institut :',
    },
    'iq0i8648': {
      'en': 'Type :',
      'de': 'Typ :',
      'sv': 'Typ :',
    },
    'vtwg1xzt': {
      'en': '+ Add  another Training or Education',
      'de': '+ F??gen Sie eine weitere Schulung oder Ausbildung hinzu',
      'sv': '+ L??gg till ytterligare en utbildning eller utbildning',
    },
    '1yok932v': {
      'en': 'Messaging',
      'de': 'Nachrichten',
      'sv': 'Meddelanden',
    },
  },
  // Education2
  {
    'cyaeowue': {
      'en': 'Post a task',
      'de': 'Poste eine Aufgabe',
      'sv': 'L??gg upp en uppgift',
    },
    '8g3xywhl': {
      'en': 'Education',
      'de': 'Ausbildung',
      'sv': 'Utbildning',
    },
    'thigntiw': {
      'en': 'No Education Entered',
      'de': 'Keine Ausbildung eingegeben',
      'sv': 'Ingen utbildning angett',
    },
    'd7tp7o71': {
      'en': 'Adding Educations will help to improve\nyour profile ranking and ',
      'de':
          'Das Hinzuf??gen von Ausbildungen wird zur Verbesserung beitragen\nIhr Profilranking und',
      'sv':
          'Att l??gga till utbildningar hj??lper till att f??rb??ttra\ndin profilrankning och',
    },
    'ei4qnbtl': {
      'en': '+ Add  another Training or Education',
      'de': '+ F??gen Sie eine weitere Schulung oder Ausbildung hinzu',
      'sv': '+ L??gg till ytterligare en utbildning eller utbildning',
    },
    'sk0ryvt0': {
      'en': 'Messaging',
      'de': 'Nachrichten',
      'sv': 'Meddelanden',
    },
  },
  // homePage-M-06
  {
    'e3quq81w': {
      'en': '<   Back ',
      'de': '< Zur??ck',
      'sv': '< Tillbaka',
    },
    '7ds8baxz': {
      'en': 'Categories',
      'de': 'Kategorien',
      'sv': 'Kategorier',
    },
    '04z2plrn': {
      'en': 'Baby-Sitting',
      'de': 'Babysitting',
      'sv': 'Barnpassning',
    },
    'zogejv4j': {
      'en': 'Gardening',
      'de': 'Gartenarbeit',
      'sv': 'Tr??dg??rdsarbete',
    },
    '4d3c7xju': {
      'en': 'Handwork',
      'de': 'Handarbeit',
      'sv': 'Handarbete',
    },
    '57odyp6t': {
      'en': 'Housekeeping',
      'de': 'Haushaltsf??hrung',
      'sv': 'Hush??llning',
    },
    'h1fc2zit': {
      'en': 'Senior care',
      'de': 'Seniorenbetreuung',
      'sv': '??ldrev??rd',
    },
    '7hykr7pd': {
      'en': 'Party & Event',
      'de': 'Party & Veranstaltung',
      'sv': 'Fest & Event',
    },
    'ptwyhp53': {
      'en': 'Music',
      'de': 'Musik',
      'sv': 'musik',
    },
    '2fw9x6yr': {
      'en': 'Computer & IT',
      'de': 'Computer & IT',
      'sv': 'Dator & IT',
    },
    'hn5yt8wu': {
      'en': 'Haircut & Beauty',
      'de': 'Haarschnitt & Sch??nheit',
      'sv': 'Frisyr & Sk??nhet',
    },
    'jerzxfal': {
      'en': 'Languages',
      'de': 'Sprachen',
      'sv': 'spr??k',
    },
    '7l5wg7c4': {
      'en': 'Taeching',
      'de': 'Taeching',
      'sv': 'Undervisning',
    },
    '1wyvkiko': {
      'en': 'Therapy - Nursing',
      'de': 'Therapie - Pflege',
      'sv': 'Terapi - Omv??rdnad',
    },
    'en6mo9le': {
      'en': 'Cook & Catering',
      'de': 'Koch & Gastronomie',
      'sv': 'Kock & Catering',
    },
    'hgt26sc9': {
      'en': 'Relocation',
      'de': 'Verlegung',
      'sv': 'Omlokalisering',
    },
    'nvhsjti2': {
      'en': 'Pet-Sitting',
      'de': 'Haustierbetreuung',
      'sv': 'Husdjursvakt',
    },
    '6q2zw3zq': {
      'en': 'Entertainment',
      'de': 'Unterhaltung',
      'sv': 'Underh??llning',
    },
    '1yybaxyj': {
      'en': 'Home',
      'de': 'Zuhause',
      'sv': 'Hem',
    },
  },
  // homePage-M-07
  {
    'j2hsorib': {
      'en': '<   Back ',
      'de': '< Zur??ck',
      'sv': '< Tillbaka',
    },
    'z9epvb4e': {
      'en': 'language',
      'de': 'Sprache',
      'sv': 'spr??k',
    },
    '0jzlxelp': {
      'en': 'Select Country',
      'de': 'Land ausw??hlen',
      'sv': 'V??lj land',
    },
    '7me8pad5': {
      'en': 'Germany',
      'de': 'Deutschland',
      'sv': 'Tyskland',
    },
    'n4ae61du': {
      'en': 'Switzerland',
      'de': 'Schweiz',
      'sv': 'Schweiz',
    },
    'b94c0k5i': {
      'en': 'Nederland',
      'de': 'Niederlande',
      'sv': 'Nederland',
    },
    'dvgsv2oo': {
      'en': 'Dansk',
      'de': 'D??nisch',
      'sv': 'Dansk',
    },
    '482ulbxl': {
      'en': 'Belgique',
      'de': 'Belgien',
      'sv': 'Belgique',
    },
    'zyxutk9d': {
      'en': '??sterreich',
      'de': '??sterreich',
      'sv': '??sterreich',
    },
    '8p6qyf4i': {
      'en': 'Select Language',
      'de': 'Sprache ausw??hlen',
      'sv': 'V??lj spr??k',
    },
    'lt86wxjh': {
      'en': 'Deutsch',
      'de': 'Deutsch',
      'sv': 'Deutsch',
    },
    '7h821qb8': {
      'en': 'English',
      'de': 'Englisch',
      'sv': 'engelsk',
    },
    '5x6zm3i1': {
      'en': 'Apply',
      'de': 'Anwenden',
      'sv': 'Till??mpa',
    },
    'funbnnh7': {
      'en': 'Home',
      'de': 'Zuhause',
      'sv': 'Hem',
    },
  },
  // Rates
  {
    'q20z5oll': {
      'en': 'Post a task',
      'de': 'Poste eine Aufgabe',
      'sv': 'L??gg upp en uppgift',
    },
    'pn4izkcz': {
      'en': 'Rates',
      'de': 'Preise',
      'sv': 'Priser',
    },
    'k6bxvrzw': {
      'en': '1',
      'de': '1',
      'sv': '1',
    },
    'e49wt6fj': {
      'en': '24 ??? ',
      'de': '24 ???',
      'sv': '24 ???',
    },
    'f9rgk5fc': {
      'en': 'per hour',
      'de': 'pro Stunde',
      'sv': 'per timme',
    },
    'hfru6bcr': {
      'en': 'Skills :',
      'de': 'Kompetenzen :',
      'sv': 'Kompetens :',
    },
    'dgxlopt2': {
      'en': 'Gardening',
      'de': 'Gartenarbeit',
      'sv': 'Tr??dg??rdsarbete',
    },
    'nzw1frnf': {
      'en': ' Music ',
      'de': 'Musik',
      'sv': 'musik',
    },
    'v3k530qs': {
      'en': 'Baby-sitting',
      'de': 'Babysitting',
      'sv': 'Barnpassning',
    },
    'shfjessn': {
      'en': '2',
      'de': '2',
      'sv': '2',
    },
    '3sw22cgr': {
      'en': '42 ??? ',
      'de': '42 ???',
      'sv': '42 ???',
    },
    'zpvc0ol9': {
      'en': 'per hour',
      'de': 'pro Stunde',
      'sv': 'per timme',
    },
    'ufsbztyj': {
      'en': 'Skills :',
      'de': 'Kompetenzen :',
      'sv': 'Kompetens :',
    },
    'g8asdmay': {
      'en': 'Therapy-Nursing',
      'de': 'Therapie-Pflege',
      'sv': 'Terapi-omv??rdnad',
    },
    '695tkl0q': {
      'en': 'Teaching',
      'de': 'Unterrichten',
      'sv': 'Undervisning',
    },
    'jhrih20u': {
      'en': '+ Add another rate',
      'de': '+ F??gen Sie einen weiteren Tarif hinzu',
      'sv': '+ L??gg till ytterligare ett pris',
    },
    '9wz7x9az': {
      'en': 'Messaging',
      'de': 'Nachrichten',
      'sv': 'Meddelanden',
    },
  },
  // Rates2
  {
    'wfey2zj6': {
      'en': 'Post a task',
      'de': 'Poste eine Aufgabe',
      'sv': 'L??gg upp en uppgift',
    },
    '60rjkn17': {
      'en': 'Rates',
      'de': 'Preise',
      'sv': 'Priser',
    },
    'u28wnb5m': {
      'en': 'No Rate Added',
      'de': 'Kein Preis hinzugef??gt',
      'sv': 'Ingen kurs lagts till',
    },
    'ol7mxqrl': {
      'en': 'Add rate so that posters can ',
      'de': 'Rate hinzuf??gen, damit Plakate k??nnen',
      'sv': 'L??gg till pris s?? att affischer kan',
    },
    '20ex4vfw': {
      'en': '+ Add rate',
      'de': '+ Rate hinzuf??gen',
      'sv': '+ L??gg till hastighet',
    },
    'jbz2wlu8': {
      'en': 'Messaging',
      'de': 'Nachrichten',
      'sv': 'Meddelanden',
    },
  },
  // TaskAppointment
  {
    'gn4zd4k4': {
      'en': 'Post a task',
      'de': 'Poste eine Aufgabe',
      'sv': 'L??gg upp en uppgift',
    },
    'hf2mcn58': {
      'en': 'Task Number: ',
      'de': 'Aufgabennummer:',
      'sv': 'Uppgiftsnummer:',
    },
    'gfbqcw0o': {
      'en': '581521513',
      'de': '581521513',
      'sv': '581521513',
    },
    'kxyqign5': {
      'en': 'User :',
      'de': 'Benutzer :',
      'sv': 'Anv??ndare:',
    },
    'lcks99ff': {
      'en': 'Katrin Smith',
      'de': 'Katrin Schmidt',
      'sv': 'Katrin Smith',
    },
    'nfg1fm0w': {
      'en': 'Remaining :',
      'de': 'Verbleibend :',
      'sv': '??terst??ende :',
    },
    '1q2vwxv6': {
      'en': '2d, 23h, 23m',
      'de': '2d, 23h, 23m',
      'sv': '2d, 23h, 23m',
    },
    '0h10hmtf': {
      'en': 'Time :',
      'de': 'Zeit :',
      'sv': 'Tid:',
    },
    'fefns5dq': {
      'en': '13:00 h ???18:00h ',
      'de': '13:00 ???18:00 Uhr',
      'sv': '13:00 ??? 18:00',
    },
    'dg6nld0n': {
      'en': 'Dalberg Galerie, Hohe Str. 25, 44139 \nDortmund, Germany',
      'de': 'Aufgabennummer:',
      'sv': 'Uppgiftsnummer:',
    },
    '0iejrk5t': {
      'en': 'Messaging',
      'de': 'Nachrichten',
      'sv': 'Meddelanden',
    },
  },
  // sign_up-M-126
  {
    'aeeovj91': {
      'en': 'Post a task',
      'de': 'Poste eine Aufgabe',
      'sv': 'L??gg upp en uppgift',
    },
    'einhgr0t': {
      'en': 'We just sent you a sms to below \nnumber!',
      'de': 'Wir haben Ihnen gerade eine SMS an unten gesendet\nAnzahl!',
      'sv': 'Vi har precis skickat ett sms till dig nedan\nsiffra!',
    },
    '8eofqr5y': {
      'en': 'Country code',
      'de': 'Landesvorwahl',
      'sv': 'Landskod',
    },
    'htxj39a6': {
      'en': 'Mobile number',
      'de': 'Handy Nummer',
      'sv': 'Mobilnummer',
    },
    'fj1l5w7f': {
      'en': 'Request a new code! ',
      'de': 'Fordern Sie einen neuen Code!',
      'sv': 'Beg??r en ny kod!',
    },
    'zmvwfln9': {
      'en': 'Enter your 4 digit code here!',
      'de': 'Geben Sie hier Ihren 4-stelligen Code ein!',
      'sv': 'Ange din 4-siffriga kod h??r!',
    },
    'gtzg8pre': {
      'en': '0',
      'de': '0',
      'sv': '0',
    },
    '40ta0jq7': {
      'en': '0',
      'de': '0',
      'sv': '0',
    },
    'm5u8p4yr': {
      'en': '0',
      'de': '0',
      'sv': '0',
    },
    'ngshwgbt': {
      'en': '0',
      'de': '0',
      'sv': '0',
    },
    '7l9mhsck': {
      'en': 'Home',
      'de': 'Zuhause',
      'sv': 'Hem',
    },
  },
  // DateofBirth-M-173
  {
    '7wi7t5ld': {
      'en': 'Post a task',
      'de': 'Poste eine Aufgabe',
      'sv': 'L??gg upp en uppgift',
    },
    'zdhj1x57': {
      'en': 'First Name',
      'de': 'Vorname',
      'sv': 'F??rnamn',
    },
    '1fwph8xp': {
      'en': '[Some hint text...]',
      'de': '[Einige Hinweistexte...]',
      'sv': '[N??gon tipstext...]',
    },
    'qtipf6y6': {
      'en': 'Last Name',
      'de': 'Nachname',
      'sv': 'Efternamn',
    },
    'sx12e065': {
      'en': '',
      'de': '',
      'sv': '',
    },
    'd0n1ahxc': {
      'en': 'Email',
      'de': 'Email',
      'sv': 'E-post',
    },
    'u0a39z02': {
      'en': 'Password',
      'de': 'Passwort',
      'sv': 'L??senord',
    },
    'k1ixi8on': {
      'en': '******************',
      'de': '*****************',
      'sv': '******************',
    },
    '7oe81z4f': {
      'en': 'I\'ll do it later',
      'de': 'Ich werde es sp??ter machen',
      'sv': 'jag g??r det senare',
    },
    'pu5e3hmy': {
      'en': 'Next   >',
      'de': 'Weiter >',
      'sv': 'N??sta >',
    },
    'urklmvrs': {
      'en': 'Home',
      'de': 'Zuhause',
      'sv': 'Hem',
    },
  },
  // sign_up_M-165
  {
    'l1fhcfh1': {
      'en': 'Add trainings and education you \nparticipated',
      'de': 'F??gen Sie Schulungen und Ausbildungen hinzu\nteilgenommen',
      'sv': 'L??gg till utbildningar och utbildning du\ndeltog',
    },
    '1fln6ucc': {
      'en': 'Education / Training Name',
      'de': 'Ausbildungs-/Schulungsname',
      'sv': 'Namn p?? utbildning/utbildning',
    },
    'v5e7ci7m': {
      'en': 'Name of Institue / Company',
      'de': 'Name des Instituts / Unternehmens',
      'sv': 'Namn p?? institutet/f??retaget',
    },
    'nsgn1m89': {
      'en': 'Add photo below',
      'de': 'Foto unten hinzuf??gen',
      'sv': 'L??gg till foto nedan',
    },
    'yyc5waqe': {
      'en': 'I\'ll do it later',
      'de': 'Ich werde es sp??ter machen',
      'sv': 'jag g??r det senare',
    },
    'xv17yvso': {
      'en': '+Add',
      'de': '+Hinzuf??gen',
      'sv': '+L??gg till',
    },
    'xf6zkmx7': {
      'en': 'Home',
      'de': 'Zuhause',
      'sv': 'Hem',
    },
  },
  // sign_up_M-167
  {
    'k18q7p1l': {
      'en': 'Click in the box to add your Certificate',
      'de': 'Klicken Sie in das Feld, um Ihr Zertifikat hinzuzuf??gen',
      'sv': 'Klicka i rutan f??r att l??gga till ditt certifikat',
    },
    'u8km5zz7': {
      'en': 'Take photo',
      'de': 'Foto machen',
      'sv': 'Ta ett foto',
    },
    '4ya3xb9y': {
      'en': 'I\'ll do it later',
      'de': 'Ich werde es sp??ter machen',
      'sv': 'jag g??r det senare',
    },
    '7ngo3ct9': {
      'en': 'Save',
      'de': 'Speichern',
      'sv': 'Spara',
    },
    'kbzdroab': {
      'en': 'Home',
      'de': 'Zuhause',
      'sv': 'Hem',
    },
  },
  // Signup-M-166
  {
    'dyaetl33': {
      'en': 'Post a task',
      'de': 'Poste eine Aufgabe',
      'sv': 'L??gg upp en uppgift',
    },
    'b5teaela': {
      'en': 'Education',
      'de': 'Ausbildung',
      'sv': 'Utbildning',
    },
    'wvbrpezj': {
      'en': 'Name :',
      'de': 'Name :',
      'sv': 'Namn :',
    },
    'rr3ihb0o': {
      'en': 'Name of Institute :',
      'de': 'Name des Institutes :',
      'sv': 'Namn p?? Institut :',
    },
    '5zoghuwd': {
      'en': 'Type :',
      'de': 'Typ :',
      'sv': 'Typ :',
    },
    'ntficze9': {
      'en': '+ Add  another Training or Education',
      'de': '+ F??gen Sie eine weitere Schulung oder Ausbildung hinzu',
      'sv': '+ L??gg till ytterligare en utbildning eller utbildning',
    },
    'b60en9zl': {
      'en': 'I\'ll do it later',
      'de': 'Ich werde es sp??ter machen',
      'sv': 'jag g??r det senare',
    },
    'lon4td6w': {
      'en': 'Save',
      'de': 'Speichern',
      'sv': 'Spara',
    },
    'i266h5oo': {
      'en': 'Messaging',
      'de': 'Nachrichten',
      'sv': 'Meddelanden',
    },
  },
  // sign_up_M-168
  {
    'pd45c9ds': {
      'en': 'Gardening Master',
      'de': 'Gartenmeister',
      'sv': 'Tr??dg??rdsm??stare',
    },
    '9s7u13pk': {
      'en': 'Education / Training Name',
      'de': 'Ausbildungs-/Schulungsname',
      'sv': 'Namn p?? utbildning/utbildning',
    },
    '6hdei09j': {
      'en': 'Name of Institute / Company',
      'de': 'Name des Instituts / Unternehmens',
      'sv': 'Namn p?? institutet/f??retaget',
    },
    'aecsmpox': {
      'en': '+ Add certificate',
      'de': '+ Zertifikat hinzuf??gen',
      'sv': '+ L??gg till certifikat',
    },
    'naz813og': {
      'en': 'I\'ll do it later',
      'de': 'Ich werde es sp??ter machen',
      'sv': 'jag g??r det senare',
    },
    'k83kia8h': {
      'en': 'Save',
      'de': 'Speichern',
      'sv': 'Spara',
    },
    '9hjmpfkq': {
      'en': 'Home',
      'de': 'Zuhause',
      'sv': 'Hem',
    },
  },
  // rate_m-169
  {
    '1v8ywnog': {
      'en': 'You can enter multiple rates',
      'de': 'Sie k??nnen mehrere Tarife eingeben',
      'sv': 'Du kan ange flera priser',
    },
    '0ek9cb4h': {
      'en': 'For Selected Skills',
      'de': 'F??r ausgew??hlte F??higkeiten',
      'sv': 'F??r utvalda f??rdigheter',
    },
    'zkg1qt60': {
      'en': 'Apply for all my Skills ',
      'de': 'Bewerben Sie sich f??r alle meine Skills',
      'sv': 'Ans??k om alla mina f??rdigheter',
    },
    'kndafgz7': {
      'en': 'How much',
      'de': 'Wie viel',
      'sv': 'Hur mycket',
    },
    'v8zw0idf': {
      'en': 'Currency',
      'de': 'W??hrung',
      'sv': 'Valuta',
    },
    'olnwdkq3': {
      'en': '24',
      'de': '24',
      'sv': '24',
    },
    'j8huvphn': {
      'en': '???',
      'de': '???',
      'sv': '???',
    },
    '8w421irg': {
      'en': 'Per hour',
      'de': 'Pro Stunde',
      'sv': 'Per timme',
    },
    'wgeuixyk': {
      'en': 'Degree',
      'de': 'Grad',
      'sv': 'Grad',
    },
    'y9xqif8m': {
      'en': 'Training  ',
      'de': 'Ausbildung',
      'sv': 'Tr??ning',
    },
    'zahtbqdj': {
      'en': 'Student ',
      'de': 'Student',
      'sv': 'Studerande',
    },
    'so7vdx5g': {
      'en': 'Participation',
      'de': 'Beteiligung',
      'sv': 'Deltagande',
    },
    'efyvqjkz': {
      'en': 'Student ',
      'de': 'Student',
      'sv': 'Studerande',
    },
    '0i5k062c': {
      'en': 'I\'ll do it later',
      'de': 'Ich werde es sp??ter machen',
      'sv': 'jag g??r det senare',
    },
    'ceqmoxec': {
      'en': 'OK',
      'de': 'OK',
      'sv': 'OK',
    },
    'idz4lkwe': {
      'en': 'Home',
      'de': 'Zuhause',
      'sv': 'Hem',
    },
  },
  // sign_upEducation
  {
    'c5mntwmp': {
      'en': 'Post a task',
      'de': 'Poste eine Aufgabe',
      'sv': 'L??gg upp en uppgift',
    },
    '56aaulr7': {
      'en': 'Education',
      'de': 'Ausbildung',
      'sv': 'Utbildning',
    },
    'nz99g916': {
      'en': '1',
      'de': '1',
      'sv': '1',
    },
    'wlbkfben': {
      'en': 'Name :',
      'de': 'Name :',
      'sv': 'Namn :',
    },
    'u7zu9h04': {
      'en': 'Gardening Master',
      'de': 'Gartenmeister',
      'sv': 'Tr??dg??rdsm??stare',
    },
    'k4vo81jb': {
      'en': 'Name of Institute :',
      'de': 'Name des Institutes :',
      'sv': 'Namn p?? Institut :',
    },
    'gafx003o': {
      'en': 'Gardening School ',
      'de': 'Gartenschule',
      'sv': 'Tr??dg??rdsskola',
    },
    'tq2in646': {
      'en': 'Type :',
      'de': 'Typ :',
      'sv': 'Typ :',
    },
    'tbfh3thc': {
      'en': 'Participation',
      'de': 'Beteiligung',
      'sv': 'Deltagande',
    },
    'wq8w8fod': {
      'en': 'View certificate',
      'de': 'Zertifikat ansehen',
      'sv': 'Se certifikat',
    },
    'qfhua49z': {
      'en': '2',
      'de': '2',
      'sv': '2',
    },
    'eeqkhhk0': {
      'en': 'Name :',
      'de': 'Name :',
      'sv': 'Namn :',
    },
    'e4l1njyc': {
      'en': 'Gardening Master',
      'de': 'Gartenmeister',
      'sv': 'Tr??dg??rdsm??stare',
    },
    'fdg3h92a': {
      'en': 'Name of Institute :',
      'de': 'Name des Institutes :',
      'sv': 'Namn p?? Institut :',
    },
    '7zjcjibp': {
      'en': 'Gardening School ',
      'de': 'Gartenschule',
      'sv': 'Tr??dg??rdsskola',
    },
    's9wcwn2p': {
      'en': 'Type :',
      'de': 'Typ :',
      'sv': 'Typ :',
    },
    'rtb2vyvr': {
      'en': 'Participation',
      'de': 'Beteiligung',
      'sv': 'Deltagande',
    },
    'rz75grvo': {
      'en': '+Add certificate',
      'de': '+Zertifikat hinzuf??gen',
      'sv': '+L??gg till certifikat',
    },
    'exephibn': {
      'en': '+ Add  another Training or Education',
      'de': '+ F??gen Sie eine weitere Schulung oder Ausbildung hinzu',
      'sv': '+ L??gg till ytterligare en utbildning eller utbildning',
    },
    'julz3xjx': {
      'en': 'I\'ll do it later',
      'de': 'Ich werde es sp??ter machen',
      'sv': 'jag g??r det senare',
    },
    'rqe9ejf8': {
      'en': 'Save',
      'de': 'Speichern',
      'sv': 'Spara',
    },
    'l2idp92p': {
      'en': 'Messaging',
      'de': 'Nachrichten',
      'sv': 'Meddelanden',
    },
  },
  // Rates_M-171
  {
    'v2vi43yk': {
      'en': 'Post a task',
      'de': 'Poste eine Aufgabe',
      'sv': 'L??gg upp en uppgift',
    },
    'hp16i1i5': {
      'en': 'Rates',
      'de': 'Preise',
      'sv': 'Priser',
    },
    'f6vmqj6q': {
      'en': '1',
      'de': '1',
      'sv': '1',
    },
    'u2ej9duk': {
      'en': '24 ??? ',
      'de': '24 ???',
      'sv': '24 ???',
    },
    'yrdnvb57': {
      'en': 'per hour',
      'de': 'pro Stunde',
      'sv': 'per timme',
    },
    'sjo1fskm': {
      'en': 'Skills :',
      'de': 'Kompetenzen :',
      'sv': 'Kompetens :',
    },
    'q7gddbjt': {
      'en': 'Gardening',
      'de': 'Gartenarbeit',
      'sv': 'Tr??dg??rdsarbete',
    },
    'z0x1817p': {
      'en': ' Music ',
      'de': 'Musik',
      'sv': 'musik',
    },
    'zt5xhmcu': {
      'en': 'Baby-sitting',
      'de': 'Babysitting',
      'sv': 'Barnpassning',
    },
    'as1fmqz1': {
      'en': '2',
      'de': '2',
      'sv': '2',
    },
    'stkyikaq': {
      'en': '42 ??? ',
      'de': '42 ???',
      'sv': '42 ???',
    },
    'r98qev29': {
      'en': 'per hour',
      'de': 'pro Stunde',
      'sv': 'per timme',
    },
    '6j4vlxiy': {
      'en': 'Skills :',
      'de': 'Kompetenzen :',
      'sv': 'Kompetens :',
    },
    'g14h2e64': {
      'en': 'Therapy-Nursing',
      'de': 'Therapie-Pflege',
      'sv': 'Terapi-omv??rdnad',
    },
    '7957yeba': {
      'en': 'Teaching',
      'de': 'Unterrichten',
      'sv': 'Undervisning',
    },
    'v1rojr6u': {
      'en': '+ Add another rate',
      'de': '+ F??gen Sie einen weiteren Tarif hinzu',
      'sv': '+ L??gg till ytterligare ett pris',
    },
    '14j3o3xe': {
      'en': 'I\'ll do it later',
      'de': 'Ich werde es sp??ter machen',
      'sv': 'jag g??r det senare',
    },
    '99o6tanl': {
      'en': 'Save',
      'de': 'Speichern',
      'sv': 'Spara',
    },
    'rz9hn0as': {
      'en': 'Messaging',
      'de': 'Nachrichten',
      'sv': 'Meddelanden',
    },
  },
  // ChooseSkillls-M146
  {
    '1zljve4s': {
      'en': 'Post a task',
      'de': 'Poste eine Aufgabe',
      'sv': 'L??gg upp en uppgift',
    },
    '3p9m3k4n': {
      'en': 'Baby-sitting',
      'de': 'Babysitting',
      'sv': 'Barnpassning',
    },
    'p98axwx2': {
      'en': 'Got a few boxes to shift, an apartment or \nentire house',
      'de':
          'Habe ein paar Kisten zu verschieben, eine Wohnung bzw\nganzes Haus',
      'sv': 'Fick n??gra l??dor att flytta, en l??genhet eller\nhela huset',
    },
    'yyfddyqq': {
      'en': 'Baby-sittingXXXXXXX',
      'de': 'BabysittingXXXXXXX',
      'sv': 'BarnvaktXXXXXXX',
    },
    'u08wribj': {
      'en': 'Infants Sitting ',
      'de': 'Kleinkinder sitzen',
      'sv': 'Sitter f??r sp??dbarn',
    },
    '27m02tn6': {
      'en': 'Kids Sitting ',
      'de': 'Kinder sitzen',
      'sv': 'Barn som sitter',
    },
    '6ridz7mz': {
      'en': 'Midwife Care ',
      'de': 'Hebammenbetreuung',
      'sv': 'Barnmorskev??rd',
    },
    '0dk29kzd': {
      'en': 'Choose a category to get Started:',
      'de': 'W??hlen Sie eine Kategorie, um loszulegen:',
      'sv': 'V??lj en kategori f??r att komma ig??ng:',
    },
    '1oo2eqg4': {
      'en': 'Gardening',
      'de': 'Gartenarbeit',
      'sv': 'Tr??dg??rdsarbete',
    },
    'j54uua8s': {
      'en': 'Handwork',
      'de': 'Handarbeit',
      'sv': 'Handarbete',
    },
    'uzkd90sy': {
      'en': 'Housekeeping',
      'de': 'Haushaltsf??hrung',
      'sv': 'Hush??llning',
    },
    '1c2duhsl': {
      'en': 'Senior care',
      'de': 'Seniorenbetreuung',
      'sv': '??ldrev??rd',
    },
    '7jm0yvba': {
      'en': 'Party & Event',
      'de': 'Party & Veranstaltung',
      'sv': 'Fest & Event',
    },
    'wsmu05yl': {
      'en': 'Music',
      'de': 'Musik',
      'sv': 'musik',
    },
    'dmi84g4i': {
      'en': 'Computer & IT',
      'de': 'Computer & IT',
      'sv': 'Dator & IT',
    },
    '3ppqe95w': {
      'en': 'Haircut & Beauty',
      'de': 'Haarschnitt & Sch??nheit',
      'sv': 'Frisyr & Sk??nhet',
    },
    'fr0dd1o0': {
      'en': 'Languages',
      'de': 'Sprachen',
      'sv': 'spr??k',
    },
    '5bhkm0tb': {
      'en': 'Taeching',
      'de': 'Taeching',
      'sv': 'Undervisning',
    },
    'yj15roq2': {
      'en': 'Therapy-Nursing',
      'de': 'Therapie-Pflege',
      'sv': 'Terapi-omv??rdnad',
    },
    'ogmh2ucq': {
      'en': 'Cook & Catering',
      'de': 'Koch & Gastronomie',
      'sv': 'Kock & Catering',
    },
    '5k1yquln': {
      'en': 'Relocation',
      'de': 'Verlegung',
      'sv': 'Omlokalisering',
    },
    '2h5mjlhh': {
      'en': 'Pet-Sitting',
      'de': 'Haustierbetreuung',
      'sv': 'Husdjursvakt',
    },
    'xkn0znsx': {
      'en': 'Entertainment',
      'de': 'Unterhaltung',
      'sv': 'Underh??llning',
    },
    'l7yyvl62': {
      'en': 'Search tasks',
      'de': 'Aufgaben suchen',
      'sv': 'S??k uppgifter',
    },
    'i1evitzr': {
      'en': 'Search taskers',
      'de': 'Tasker suchen',
      'sv': 'S??k arbetstagare',
    },
    '0mqp2d0c': {
      'en': 'Chosen categories',
      'de': 'Ausgew??hlte Kategorien',
      'sv': 'Valda kategorier',
    },
    '1hkltvdd': {
      'en': 'I\'ll do it later',
      'de': 'Ich werde es sp??ter machen',
      'sv': 'jag g??r det senare',
    },
    'elfytapl': {
      'en': 'Save',
      'de': 'Speichern',
      'sv': 'Spara',
    },
    'eblpxb6z': {
      'en': 'Home',
      'de': 'Zuhause',
      'sv': 'Hem',
    },
  },
  // DescribeYourself
  {
    'ko05agqv': {
      'en': 'Post a task',
      'de': 'Poste eine Aufgabe',
      'sv': 'L??gg upp en uppgift',
    },
    'yor8ksla': {
      'en': 'Describe your self',
      'de': 'Beschreibe dich selbst',
      'sv': 'Beskriv dig sj??lv',
    },
    'ny9300tw': {
      'en': 'Describe your self example ..',
      'de': '[Einige Hinweistexte...]',
      'sv': '[N??gon tipstext...]',
    },
    '31ir3mby': {
      'en': 'I\'ll do it later',
      'de': 'Ich werde es sp??ter machen',
      'sv': 'jag g??r det senare',
    },
    '3j18r0fg': {
      'en': 'Save',
      'de': 'Speichern',
      'sv': 'Spara',
    },
    'nqydecjn': {
      'en': 'Home',
      'de': 'Zuhause',
      'sv': 'Hem',
    },
  },
  // Profile-M-151
  {
    'hr884r46': {
      'en': 'Click in the box to add your Profile \nphoto',
      'de': 'Klicken Sie in das Feld, um Ihr Profil hinzuzuf??gen\nFoto',
      'sv': 'Klicka i rutan f??r att l??gga till din profil\nFoto',
    },
    '7eaylqyg': {
      'en': 'I\'ll do it later',
      'de': 'Ich werde es sp??ter machen',
      'sv': 'jag g??r det senare',
    },
    'ty4zgkpl': {
      'en': 'Save',
      'de': 'Speichern',
      'sv': 'Spara',
    },
    'kzmam0mz': {
      'en': 'Home',
      'de': 'Zuhause',
      'sv': 'Hem',
    },
  },
  // serach_result_task
  {
    'gy9hey21': {
      'en': 'Task',
      'de': 'Aufgabe',
      'sv': 'Uppgift',
    },
    'i7si9s4r': {
      'en': 'Tasker',
      'de': 'Tasker',
      'sv': 'Tasker',
    },
    'k7j01cix': {
      'en': 'All',
      'de': 'Alles',
      'sv': 'Allt',
    },
    '56ewyaaa': {
      'en': 'Date',
      'de': 'Datum',
      'sv': 'Datum',
    },
    'e8jceuuy': {
      'en': 'Relevance',
      'de': 'Relevanz',
      'sv': 'Relevans',
    },
    '7jv6cin2': {
      'en': 'Price',
      'de': 'Preis',
      'sv': 'Pris',
    },
    'ker7zagt': {
      'en': 'Open task only',
      'de': 'Nur offene Aufgabe',
      'sv': 'Endast ??ppen uppgift',
    },
    'uwb2b5ln': {
      'en': 'PREMIUM',
      'de': 'PR??MIE',
      'sv': 'PREMIE',
    },
    'bqz8wsg4': {
      'en': 'MAR 15, 2019',
      'de': '15. M??RZ 2019',
      'sv': '15 MARS 2019',
    },
    '6kps9r61': {
      'en': 'Since 1990',
      'de': 'Seit 1990',
      'sv': 'Sedan 1990',
    },
    'tx2zpynz': {
      'en': 'James Smith',
      'de': 'James Smith',
      'sv': 'James Smith',
    },
    'w3zfxfq7': {
      'en': 'Dortmund | DE  ',
      'de': 'Dortmund | DE',
      'sv': 'Dortmund | DE',
    },
    'f2qleerm': {
      'en': '61???',
      'de': '61???',
      'sv': '61???',
    },
    '5qn3zjak': {
      'en': 'per hour',
      'de': 'pro Stunde',
      'sv': 'per timme',
    },
    '7mdwv50l': {
      'en': '45',
      'de': '45',
      'sv': '45',
    },
    'axki6a1v': {
      'en': 'Home',
      'de': 'Zuhause',
      'sv': 'Hem',
    },
  },
  // serach_result
  {
    'ofrx0jpi': {
      'en': 'Task',
      'de': 'Aufgabe',
      'sv': 'Uppgift',
    },
    'ojgnai07': {
      'en': 'Tasker',
      'de': 'Tasker',
      'sv': 'Tasker',
    },
    'fr50su8u': {
      'en': 'All',
      'de': 'Alles',
      'sv': 'Allt',
    },
    '6j88ow9l': {
      'en': 'Date',
      'de': 'Datum',
      'sv': 'Datum',
    },
    '5uj5tl89': {
      'en': 'Relevance',
      'de': 'Relevanz',
      'sv': 'Relevans',
    },
    '880cfhss': {
      'en': 'Price',
      'de': 'Preis',
      'sv': 'Pris',
    },
    'cq2pep4u': {
      'en': 'Open task only',
      'de': 'Nur offene Aufgabe',
      'sv': 'Endast ??ppen uppgift',
    },
    '7q5iw4yc': {
      'en': 'Open',
      'de': 'Offen',
      'sv': '??ppen',
    },
    'wkwp8zh9': {
      'en': 'Weekly',
      'de': 'W??chentlich',
      'sv': 'Varje vecka',
    },
    'r1ww0ush': {
      'en': 'Move Boxes and Push\nbike Kew to Sydney...',
      'de':
          'Kisten verschieben und schieben\nMit dem Fahrrad von Kew nach Sydney...',
      'sv': 'Flytta l??dor och tryck\ncykla Kew till Sydney...',
    },
    'y16ij9fy': {
      'en': '61???',
      'de': '61???',
      'sv': '61???',
    },
    'tnjtvgfm': {
      'en': 'per hour',
      'de': 'pro Stunde',
      'sv': 'per timme',
    },
    'mskyiqgw': {
      'en': 'Home',
      'de': 'Zuhause',
      'sv': 'Hem',
    },
  },
  // tasks
  {
    'nbb7a9js': {
      'en': 'Post a task',
      'de': 'Poste eine Aufgabe',
      'sv': 'L??gg upp en uppgift',
    },
    'waiohs13': {
      'en': 'Messaging',
      'de': 'Nachrichten',
      'sv': 'Meddelanden',
    },
  },
  // chats
  {
    'n4y8fwc4': {
      'en': 'Post a task',
      'de': 'Poste eine Aufgabe',
      'sv': 'L??gg upp en uppgift',
    },
    'o0u2zcex': {
      'en': 'Messaging',
      'de': 'Nachrichten',
      'sv': 'Meddelanden',
    },
  },
  // chat
  {
    'oh12onby': {
      'en': 'Write a message...',
      'de': 'Eine Nachricht schreiben...',
      'sv': 'Skriv ett meddelande...',
    },
    '7m6szstx': {
      'en': 'Home',
      'de': 'Zuhause',
      'sv': 'Hem',
    },
  },
  // TASK-M-199
  {
    '42ah0pv9': {
      'en': 'Select your task',
      'de': 'W??hlen Sie Ihre Aufgabe aus',
      'sv': 'V??lj din uppgift',
    },
    '7jekclyy': {
      'en': 'Skill level',
      'de': 'F??higkeits Level',
      'sv': 'Skicklighetsniv??',
    },
    'ztlgykx8': {
      'en': 'Languages ',
      'de': 'Sprachen',
      'sv': 'spr??k',
    },
    'ubxcoeef': {
      'en': 'Option 1',
      'de': 'Option 1',
      'sv': 'Alternativ 1',
    },
    'k9dh7ofa': {
      'en': 'Description',
      'de': 'Beschreibung',
      'sv': 'Beskrivning',
    },
    'vckt87i7': {
      'en': 'Write your task description',
      'de': 'Schreiben Sie Ihre Aufgabenbeschreibung',
      'sv': 'Skriv din uppgiftsbeskrivning',
    },
    'pftbj3l2': {
      'en': 'Upload File',
      'de': 'Datei hochladen',
      'sv': 'Ladda upp fil',
    },
    's5gka6d6': {
      'en': '<   Back',
      'de': '< Zur??ck',
      'sv': '< Tillbaka',
    },
    '7oygvolm': {
      'en': 'Next   >',
      'de': 'Weiter >',
      'sv': 'N??sta >',
    },
    'fd0mlvst': {
      'en': 'Home',
      'de': 'Zuhause',
      'sv': 'Hem',
    },
  },
  // appointment
  {
    's78fy41e': {
      'en': 'Katrin Smith',
      'de': 'Katrin Schmidt',
      'sv': 'Katrin Smith',
    },
    'hgh0r7pe': {
      'en': 'appointment',
      'de': 'Termin',
      'sv': 'utn??mning',
    },
    '4o8ip07o': {
      'en': 'Appointments',
      'de': 'Termine',
      'sv': 'Utn??mningar',
    },
  },
  // TaskPubish
  {
    't6i676ur': {
      'en': 'Task Number: ',
      'de': 'Aufgabennummer:',
      'sv': 'Uppgiftsnummer:',
    },
    '10qd6vsd': {
      'en': 'Task discription',
      'de': 'Aufgabenbeschreibung',
      'sv': 'Uppgiftsbeskrivning',
    },
    'pfezpcde': {
      'en': 'See more   >',
      'de': 'Siehe mehr >',
      'sv': 'Se mer >',
    },
    '8lsde1mo': {
      'en': 'Mornings',
      'de': 'Morgens',
      'sv': 'Morgnar',
    },
    'y3mapryv': {
      'en': '2 days',
      'de': '2 Tage',
      'sv': '2 dagar',
    },
    '0ken7jtl': {
      'en': 'per month ',
      'de': 'pro Monat',
      'sv': 'per m??nad',
    },
    '6kp3it5m': {
      'en': '2 hours',
      'de': '2 Stunden',
      'sv': '2 timmar',
    },
    'oguhxq9k': {
      'en': 'each session',
      'de': 'jede Sitzung',
      'sv': 'varje session',
    },
    '4f23cixe': {
      'en': 'Preferd day:',
      'de': 'Bevorzugter Tag:',
      'sv': 'Preferred dag:',
    },
    '4m9xm2cz': {
      'en': 'Sun, Mon, Tue, Wed, Thu',
      'de': 'So, Mo, Di, Mi, Do',
      'sv': 's??n, m??n, tis, ons, tors',
    },
    'w6edjb64': {
      'en': 'Post a similar task',
      'de': 'Posten Sie eine ??hnliche Aufgabe',
      'sv': 'L??gg upp en liknande uppgift',
    },
    'ujkrs7gp': {
      'en': '<Back',
      'de': '<Zur??ck',
      'sv': '<Tillbaka',
    },
    'ys27p6ft': {
      'en': 'Messaging',
      'de': 'Nachrichten',
      'sv': 'Meddelanden',
    },
  },
  // appointmentlist
  {
    'nriwnspk': {
      'en': 'Appointment Requests from',
      'de': '',
      'sv': '',
    },
    'l662b8al': {
      'en': 'accept',
      'de': '',
      'sv': '',
    },
    'bm4998tk': {
      'en': 'Appointment Requests for',
      'de': '',
      'sv': '',
    },
    'rm5kx13u': {
      'en': 'requested',
      'de': '',
      'sv': '',
    },
    '1wh19r07': {
      'en': 'Appointment',
      'de': 'Nachrichten',
      'sv': 'Meddelanden',
    },
  },
  // appointmentdeatls
  {
    '4f0dy8xy': {
      'en': 'Lesson Name',
      'de': '',
      'sv': '',
    },
    'bu9twkxj': {
      'en': 'don\'t  accept',
      'de': '',
      'sv': '',
    },
    'c1rtgkkt': {
      'en': 'Messaging',
      'de': 'Nachrichten',
      'sv': 'Meddelanden',
    },
  },
  // Howitworks
  {
    'h9r5n7x6': {
      'en': 'Post a task',
      'de': 'Poste eine Aufgabe',
      'sv': 'L??gg upp en uppgift',
    },
    'a30ekzw0': {
      'en': 'How it works?',
      'de': 'Wie es funktioniert?',
      'sv': 'Hur det fungerar?',
    },
    '5s44yths': {
      'en': 'Post your task',
      'de': 'Poste deine Aufgabe',
      'sv': 'L??gg upp din uppgift',
    },
    'q80jpxrw': {
      'en':
          'Create a task in less than 1 minute\nSelect among options\nDefine budget and date\nDefine conditions\nPost it',
      'de':
          'Erstellen Sie eine Aufgabe in weniger als 1 Minute\nW??hlen Sie unter den Optionen aus\nDefinieren Sie Budget und Datum\nBedingungen definieren\nVer??ffentliche es',
      'sv':
          'Skapa en uppgift p?? mindre ??n 1 minut\nV??lj bland alternativ\nDefiniera budget och datum\nDefiniera villkor\nPosta det',
    },
    'j1des0oy': {
      'en': 'Make the deal',
      'de': 'Machen Sie den Deal',
      'sv': 'G??r aff??ren',
    },
    'p8bftxvc': {
      'en': 'Taskers will review and apply\nReview their profile',
      'de': 'Tasker pr??fen und bewerben sich\n??berpr??fen Sie ihr Profil',
      'sv': 'Arbetsgivare kommer att granska och ans??ka\nGranska deras profil',
    },
    '358b67qc': {
      'en': 'Post your task',
      'de': 'Poste deine Aufgabe',
      'sv': 'L??gg upp din uppgift',
    },
    'ax57roap': {
      'en': 'Confirm a tasker\nTasker will reconfirm\nYou have a deal',
      'de':
          'Best??tigen Sie einen Tasker\nTasker wird es erneut best??tigen\nSie haben eine Abmachung',
      'sv':
          'Bekr??fta en uppdragsgivare\nTasker kommer att bekr??fta igen\nDu har ett avtal',
    },
    'ybzy35bs': {
      'en': 'My Network',
      'de': 'Mein Netzwerk',
      'sv': 'Mitt n??tverk',
    },
  },
  // appointmentdeatlsRquested
  {
    'we1ng545': {
      'en': 'Lesson Name',
      'de': '',
      'sv': '',
    },
    'i0cbrhp6': {
      'en': 'edit deatls appointment',
      'de': '',
      'sv': '',
    },
    'nbo0iac6': {
      'en': 'cancel',
      'de': '',
      'sv': '',
    },
    'qbwarb5p': {
      'en': 'Messaging',
      'de': 'Nachrichten',
      'sv': 'Meddelanden',
    },
  },
  // TaskCreationDrawerContent
  {
    '0974kgsg': {
      'en': 'Task',
      'de': 'Aufgabe',
      'sv': 'Uppgift',
    },
    'sv47aeu9': {
      'en': 'Place',
      'de': 'Ort',
      'sv': 'Plats',
    },
    '5i7d3cl5': {
      'en': 'Date',
      'de': 'Datum',
      'sv': 'Datum',
    },
    'dv9sivxm': {
      'en': 'Price',
      'de': 'Preis',
      'sv': 'Pris',
    },
    'py0cazs0': {
      'en': 'Tasker',
      'de': 'Tasker',
      'sv': 'Tasker',
    },
    'wi11tuen': {
      'en': 'Resume   >',
      'de': 'Fortsetzen >',
      'sv': '??teruppta >',
    },
    '3d5hs2qd': {
      'en': 'Preview & publish ',
      'de': 'Vorschau anzeigen und ver??ffentlichen',
      'sv': 'F??rhandsgranska och publicera',
    },
  },
  // bottomSheet_appointment
  {
    'ttaczirq': {
      'en': 'Set Aoppointment',
      'de': '',
      'sv': '',
    },
    'bzn01qim': {
      'en': 'Type Appointment',
      'de': '',
      'sv': '',
    },
    'imc1k1fo': {
      'en': 'In Person',
      'de': '',
      'sv': '',
    },
    'ni47bthy': {
      'en': 'By Phone',
      'de': '',
      'sv': '',
    },
    'jxyllw7l': {
      'en': 'time stamp',
      'de': '',
      'sv': '',
    },
    'xccefah1': {
      'en': 'cancel',
      'de': '',
      'sv': '',
    },
  },
  // BtnSH_byPhone
  {
    '4o965zhe': {
      'en': 'Do you want to share your phone number ?',
      'de': '',
      'sv': '',
    },
    'gekrbt45': {
      'en': 'accepted',
      'de': '',
      'sv': '',
    },
    'z9fmvssj': {
      'en': 'NO',
      'de': '',
      'sv': '',
    },
  },
  // bottomSheetHI
  {
    'dt1oa10q': {
      'en': 'HI 1',
      'de': 'Hallo 1',
      'sv': 'HEJ 1',
    },
    'gz3r4tk7': {
      'en': 'HI 2',
      'de': 'HALLO 2',
      'sv': 'HEJ 2',
    },
    'qqxitn8b': {
      'en': 'HI 3',
      'de': 'HALLO 3',
      'sv': 'HEJ 3',
    },
  },
  // bottomSheetwhatsup
  {
    '88d6ikiz': {
      'en': 'Whats UP 1',
      'de': 'Was geht 1',
      'sv': 'Vad h??nder 1',
    },
    'vse87mlg': {
      'en': 'Whats UP 2',
      'de': 'Was geht 2',
      'sv': 'Vad h??nder 2',
    },
    'rogn81fh': {
      'en': 'Whats UP 3',
      'de': 'Was geht 3',
      'sv': 'Vad h??nder 3',
    },
  },
  // drawwerright
  {
    '5pht4rrj': {
      'en': 'Register',
      'de': 'Registrieren',
      'sv': 'Registrera',
    },
    'f389khpu': {
      'en': 'Log-in',
      'de': 'Anmeldung',
      'sv': 'Logga in',
    },
    '2l50at00': {
      'en': 'How it works',
      'de': 'Wie es funktioniert',
      'sv': 'Hur det fungerar',
    },
    '459pzgsg': {
      'en': 'Plans & Prices',
      'de': 'Pl??ne & Preise',
      'sv': 'Planer och priser',
    },
    'jzbhbtfe': {
      'en': 'Categories',
      'de': 'Kategorien',
      'sv': 'Kategorier',
    },
    'lb1c0lo8': {
      'en': 'Search tasks',
      'de': 'Aufgaben suchen',
      'sv': 'S??k uppgifter',
    },
    '0cvs9nfm': {
      'en': 'Search taskers',
      'de': 'Tasker suchen',
      'sv': 'S??k arbetstagare',
    },
    'vyg1r4ry': {
      'en': 'language',
      'de': 'Sprache',
      'sv': 'spr??k',
    },
  },
  // chooseSkillBottomSheet
  {
    '82qlc2lk': {
      'en': 'Choose Your Skills',
      'de': 'W??hlen Sie Ihre F??higkeiten',
      'sv': 'V??lj dina f??rdigheter',
    },
    'q2nn8pun': {
      'en': 'Skill Level',
      'de': 'F??higkeits Level',
      'sv': 'Skicklighetsniv??',
    },
    't9brcqzx': {
      'en': 'fields skill',
      'de': 'F??higkeits Level',
      'sv': 'Skicklighetsniv??',
    },
    '84ey9pxv': {
      'en': 'Add Skills',
      'de': 'F??higkeiten hinzuf??gen',
      'sv': 'L??gg till f??rdigheter',
    },
  },
  // Miscellaneous
  {
    'dw657jmq': {
      'en': '',
      'de': '',
      'sv': '',
    },
    'jpcwfste': {
      'en': '',
      'de': '',
      'sv': '',
    },
    '195njlb1': {
      'en': '',
      'de': '',
      'sv': '',
    },
    '6m8546an': {
      'en': '',
      'de': '',
      'sv': '',
    },
    'qkcnu83v': {
      'en': '',
      'de': '',
      'sv': '',
    },
    'v6y6qdhi': {
      'en': '',
      'de': '',
      'sv': '',
    },
    'wjn14rrr': {
      'en': '',
      'de': '',
      'sv': '',
    },
    'koez25ep': {
      'en': '',
      'de': '',
      'sv': '',
    },
    '3hfkjmb3': {
      'en': '',
      'de': '',
      'sv': '',
    },
    'hls99a73': {
      'en': '',
      'de': '',
      'sv': '',
    },
    'twi5a88y': {
      'en': '',
      'de': '',
      'sv': '',
    },
    '6utmpwpg': {
      'en': '',
      'de': '',
      'sv': '',
    },
    'pzg0b9oi': {
      'en': '',
      'de': '',
      'sv': '',
    },
    '2x7ca0gm': {
      'en': '',
      'de': '',
      'sv': '',
    },
    'kjeiqegf': {
      'en': '',
      'de': '',
      'sv': '',
    },
    'q1iheevu': {
      'en': '',
      'de': '',
      'sv': '',
    },
    'nruzhkik': {
      'en': '',
      'de': '',
      'sv': '',
    },
    'eo5159nx': {
      'en': '',
      'de': '',
      'sv': '',
    },
    'lhurim7v': {
      'en': '',
      'de': '',
      'sv': '',
    },
    '0s6siqzs': {
      'en': '',
      'de': '',
      'sv': '',
    },
    '58r63li7': {
      'en': '',
      'de': '',
      'sv': '',
    },
    '22kxswwp': {
      'en': '',
      'de': '',
      'sv': '',
    },
  },
].reduce((a, b) => a..addAll(b));
