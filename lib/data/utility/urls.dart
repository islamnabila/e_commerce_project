class Urls {
  static const String _baseurl = "http://ecom-api.teamrabbil.com/api";
  static String sentEmailOtp(String email) => "$_baseurl/UserLogin/$email";

  static String verifyOTP(String email, String otp) =>
      "$_baseurl/VerifyLogin/$email/$otp";

  static String readProfile = "$_baseurl/ReadProfile";
  static String createProfile = "$_baseurl/CreateProfile";
  static String homeBanner = "$_baseurl/ListProductSlider";
  static String categoryList = "$_baseurl/CategoryList";
  static String popularProduct = "$_baseurl/ListProductByRemark/Popular";
  static String specialProduct = "$_baseurl/ListProductByRemark/Special";
  static String newProduct = "$_baseurl/ListProductByRemark/New";

  static String productsBtCategory(int categoryId) =>
      "$_baseurl/ListProductByCategory/$categoryId";

  static String productDetails(int productId) =>
      "$_baseurl/ProductDetailsById/$productId";

  static String addToCart ="$_baseurl/CreateCartList";
  static String cartList = "$_baseurl/CartList";

  static String deleteCartList(int productId) =>
      "$_baseurl/DeleteCartList/$productId";

  static String createInvoice = "$_baseurl/InvoiceCreate";

  static String createReview = "$_baseurl/CreateProductReview";
  static String reviewList (int productId) =>"$_baseurl/ListReviewByProduct/$productId";
  static String brandList = "$_baseurl/BrandList";
  static String createWishlist(int productId) => "$_baseurl/CreateWishList/$productId";
  static String wishlist = "$_baseurl/ProductWishList";
}
