class AppUlr {
  static var baseUrl = 'https://urateddevelopmentserver.com/itiendaempleos.com';
  static var loginUrl = '$baseUrl/api/login';
  static var registerUrl = '$baseUrl/api/register';
  static var forgetPasswordUrl = '$baseUrl/api/send-verification-code';
  static var verificationCodeUrl = '$baseUrl/api/send-verification-code';
  static var newPasswordSetUrl =
      '$baseUrl/api/verify-verification-code-and-reset-password';
  static var accessTokenUrl = 'https://accounts.zoho.com/oauth/v2/token?';
  static var sendDataUrl = 'https://www.zohoapis.com/crm/v5/Contacts';
}
