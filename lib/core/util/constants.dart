import 'package:built_value/built_value.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/core/error/failures.dart';

class SharedPreferencesKeys {
  static const USERNAME = 'userName';
  // static const API_TOKEN = 'api_token';
  //
  // static const NUMBER = 'number';
  //
  // static const IS_AGENT = 'is_agent';
  //
  // static const IS_CONFIRMED = 'is_confirmed';
  //
  // static const IS_VERIFIED = 'is_verified';
  //
  // static const IS_NOT_SOCIAL = 'is_not_social';
  //
  // static const NAME = 'name';
  //
  // static const MAX_NUM_POSTS = 'max_num_posts';
  //
  // static const NUM_POSTS = 'num_posts';
  //
  // static const IS_REMEMBER_ME = 'is_remember_me';
  //
  // static const ID = 'id';
  //
  // static const IS_LOGGED_IN = 'is_logged_in';
  //
  // static const USER_NAME = 'name';
  // static const EMAIL = 'email';
  //
  // static const USER_TOKEN = 'token';
  //
  // static const MY_ADDRESS = 'myAddress';
  // static const MY_NUMBER = 'myNumber';
  // static const MY_EMAIL = 'myEmail';
  //
  // static const LOCATION = 'locationSharing';
  // static const NOTIFICATION = 'notification';
  // static const CONTACT = 'contactSharing';
  // static const COLOR = 'color';
  // static const LANGUAGE = 'language';
}

class Endpoints {
  static const BASE_URL = 'https://192.168.1.1/api/';
  // static const SOCIAL_LOGIN = 'socialLogin';
  static const LOGIN = 'login';
  // static const REGISTER = 'register';
  // static const CHECK_EMAIL = 'checkEmailNumber';
  // static const FEEDBACK = 'feedback';
  // static const CONTACTS = 'contact';
  // static const CONTACT_INFO = 'contactInfo';
  // static const CHANGEPASSWORD = 'changePassword';
  // static const CHANGENAME = 'user/update_name';
  // static const CHANGENUMBER = 'user/number';
  // static const CHANGEADDRESS = 'address';
  // static const SEARCH = 'region/by_name';
  // static const BALANCE = 'balance_user';
  // static const COST = 'requests/cost';
  // static const CONFIRM = 'request';
  // static const VERIFY_CODE = 'verifyUser';
  // static const RESEND = 'resendCode';
  // static const SETTING = 'setting';
  //
  // static update(int id) => 'contact/$id';
  //
  // static trackDelivery(int page) => 'trackDelivery?page=$page';
  //
  // static notifications(int page) => 'notifications?page=$page';
  //
  // static cancelOrder(int id) => 'request/$id/user';
  //
  // static const IMAGE_URL = 'http://167.71.60.6/';
}

const SERVER_FAILURE_MESSAGE = 'Server Failure';
const CACHE_FAILURE_MESSAGE = 'Cache Failure';

class FullTypes {}

class FullTypesFunctions {}

final OPTION = Options(
  headers: {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  },
);

final BASE_OPTIONS = BaseOptions(
  headers: {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  },
);

class RequestBody {
  static FormData login({
    @required String email,
    @required String password,
    @required String fcmToken,
  }) {
    print('email is $email, password is $password');
    return FormData.fromMap({
      'email': email,
      'password': password,
      'fcm_token': fcmToken,
    });
  }
}

class GetOptions {
  static Options options = Options();

  static Options getOptionsWithToken(String token, {String language = ''}) {
    if (token != null && token.isNotEmpty) {
      options.headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
        'Accept-Language': language,
      };
    } else {
      options.headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Accept-Language': language,
      };
    }
    return options;
  }
}

bool vertical = false;
bool horizontal = false;
bool container = false;

class FailureToMessage {
  static String getMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case CacheFailure:
        return CACHE_FAILURE_MESSAGE;
      default:
        return 'Unexpected Error';
    }
  }
}

class CustomColor {
  static const Color blue = Color.fromRGBO(39, 140, 183, 1);
  static const Color yellow = Color.fromRGBO(252, 175, 75, 1);
}
