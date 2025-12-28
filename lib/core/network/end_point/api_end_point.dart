class ApiEndPoint {

  static const String baseUrl = "http://10.10.7.7:5005/api/v1";



  //===============================Auth==================================

  static const String login = "$baseUrl/auth/login";
  static const String verifyEmail = "$baseUrl/auth/verify-email";
  static const String forgotPassword = "$baseUrl/auth/forget-password";
  static const String resetPassword = "$baseUrl/auth/reset-password";
  static const String changePassword = "$baseUrl/auth/change-password";

//===============================User==================================
  static const String createUser = "$baseUrl/users/create-user";
  static const String updateProfile = "$baseUrl/users/profile";


//===============================Favourite==================================

  static const String createFavourite = "$baseUrl/favourites/create";
  static const String deleteFavourite = "$baseUrl/favourites/694f74fbf5d14059ed76cf88";
  static const String getFavourite = "$baseUrl/favourites/me";


//===============================Histories==================================

  static const String createHistory = "$baseUrl/histories/create";
  static const String deleteHistory = "$baseUrl/histories/694f7af41610cf969f5d46e9";
  static const String getHistory = "$baseUrl/histories/me";


//===============================note==================================

  static const String createNote = "$baseUrl/notes";
  static const String getNote = "$baseUrl/notes/me";

//===============================Rating==================================
  static const String createRating= "$baseUrl/ratings/create";


//===============================Support==================================
  static const String createSupport= "$baseUrl/supports/create";

  //===============================Contact Info=================================
  static const String contactInfo= "$baseUrl/contact";
  static const String getAllRestaurantList= "$baseUrl/restaurants";



}
