class AppExceptions implements Exception {
  final String _message;
  AppExceptions(this._message);
  String get message => _message;
}

class FetchDataEx extends AppExceptions {
  FetchDataEx({String? message})
      : super(message ?? 'مشکلی در اتصال به اینترنت وجود دارد');
}

class ServerEx extends AppExceptions {
  ServerEx({String? message})
      : super(message ?? 'مشکلی در سرور بوجود امده است');
}

class NotFoundEx extends AppExceptions {
  NotFoundEx({String? message}) : super(message ?? 'موردی یافت نشد');
}

class AuthEx extends AppExceptions {
  AuthEx({String? message}) : super(message ?? 'ایمیل یا رمزعبور معتبر نیست');
}

class BadReqEx extends AppExceptions {
  BadReqEx({String? message})
      : super(message ?? 'اطلاعات اشتباه ارسال شده است');
}

class UnAuthorizedEx extends AppExceptions {
  UnAuthorizedEx({String? message})
      : super(message ?? 'ایمیل یا رمزعبور معتبر نیست');
}
