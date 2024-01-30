class Urls{
  static const String _baseurl = "https://craftybay.teamrabbil.com/api";
  static String sentEmailOtp(String email) => "$_baseurl/UserLogin/$email";
  static String verifyOTP(String email, String otp) =>"$_baseurl/VerifyLogin/$email/$otp";
  static String readProfile = "$_baseurl/ReadProfile";
  static String createProfile ="$_baseurl/CreateProfile";
  static String homeBanner ="$_baseurl/ListProductSlider";
  static String categoryList ="$_baseurl/CategoryList";

}