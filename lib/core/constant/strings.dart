abstract class AppStrings{
  static const String serverFailureMessage = 'Server Failure';
  static const String cacheFailureMessage = 'Cache Failure';
  static  String lang = 'ar';
  static  String currency = 'L.E';
  static Map<String,dynamic> translationModel={};
  static String basUrl='https://api.themoviedb.org/3/person/';
  static String imageBaseUrl='https://image.tmdb.org/t/p/w500/';
}
abstract class EndPoints{
  ///--------------------( base URL )----------------///
  static const String baseUrl = 'https://aliforas.com/api/';

  ///--------------------( user URLs )----------------///
  static const String loginUrl = 'login';
  static const String logoutUrl = 'logout';
  static const String registrationUrl = 'register';
  static const String forgetUrl = 'forget';
  static const String showUserUrl = 'authUser';
  static const String resetPasswordUrl = 'reset';
  static const String updateUserUrl = 'auth_user_Update';

///--------------------( home URLs )----------------///
  static const String homeWithAuthUrl = 'home/auth';
  static const String homeWithoutAuthUrl = 'home';

  ///--------------------( product URLs )----------------///
  static const String productSearchUrl='products/filter';
  static const String relatedProductUrl='products/related';
  static const String viewProductUrl='products/view-product';
  static const String brandProductUrl='brands';
  static const String categoryProductUrl='categories';

  ///--------------------( cart URLs )----------------///
  static const String cartProductUrl='cart';
  static const String addProductToCartUrl='cart/item';
  static const String deleteProductToCartUrl='cart/remove-item';
  static const String updateProductQntCartUrl='cart/item-quantity';
  static const String deleteCartUrl='cart/clear';

  ///--------------------( category URLs )----------------///
  static const String categoryUrl='categories';
  static const String subcategoryUrl='categories/children';

  ///--------------------( order URLs )----------------///
  static const String statesUrl='states?countryId=1';
  static const String citiesUrl='states';
  static const String showAddressUrl='my-addresses';
  static const String addOrderUrl='order/store';

}


String tr(String key)=>AppStrings.translationModel[key]??key;
String printPrice(String price)=>'$price ${AppStrings.currency}';