class APIUrlSerivces {
  //Main
  static const String server = 'http://localhost:3000/';

  //login
  static const String loginService = '${server}user/login';

  //forgot password
  static const String forgotPasswordService = '${server}user/forget-password';
  static const String verifyEmailService = '{$server}user/verify-email';
}