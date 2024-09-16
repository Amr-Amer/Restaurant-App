import 'package:easy_localization/easy_localization.dart';

class Strings {
  Strings._();

  static Strings get instance => Strings._();

  //TODO : Cart
  String get ok => tr('ok');

  String get cancel => tr('cancel');

  String get areYouSureYouWantToClearTheCart =>
      tr("are_you_sure_you_want_to_clear_the_cart");

  String get cart => tr('cart');

  String get cartIsEmpty => tr('Cart_is_empty');

  String get chooseThePaymentMethod => tr('choose_the_payment_method');

  String get visa => tr('visa');

  String get cache => tr('cache');

  String get goToCheckOut => tr('go_to_checkOut');

  //TODO : Delivery Progress
  String get deliveryInProgress => tr('delivery_in_progress');

  String get driver => tr('driver');

  // TODO : Food
  String get addons => tr('addons');

  String get addToCart => tr('add_to_cart');

  // TODO : Login
  String get foodApp => tr('food_app');

  String get email => tr('email');

  String get password => tr('password');

  String get login => tr('login');

  String get notAMember => tr('not_a_member?');

  String get registerNow => tr('register_now');

  //TODO : Payment
  String get confirmedPayment => tr('confirmed_payment?');

  String get cardNumber => tr('card_number');

  String get expiryDate => tr('expiry_date');

  String get cardHolderName => tr('card_holder_name');

  String get cvvCode => tr('cvv_code');

  String get checkout => tr('checkout');

  String get payNow => tr('pay_now');

  //TODO: Register
  String get litSCreateAnAccountForYou => tr('lit_s_create_an_account_for_you');

  String get confirmPassword => tr('confirm_password');

  String get signUp => tr('sign_up');

  String get alreadyHaveAnAccountLoginHer =>
      tr('already_have_an_account_login_her');

  String get loginNow => tr('login_now');

  String get passwordsDontMatch => tr('passwords_dont_match');

  //TODO : Settings
  String get settings => tr('settings');

  String get darkMode => tr('dark_mode');

  String get arabic => tr('arabic');

  //TODO : Side Menu
  String get home => tr("home");

  String get setting => tr("setting");

  String get logOut => tr("log_out");

  //TODO : Home
  String get sunsetDiner => tr("sunset_diner");

  String get yourLocation => tr("your_location");

  String get enterAddress => tr("enter_address");

  String get deliverNow => tr("deliver_now");

  //TODO: Description
  String get deliveryFee => tr("delivery_fee");

  String get mints => tr("mints");

  String get deliveryTime => tr("delivery_time");

  String get productAddToCart => tr("product_add_to_cart");

  String get completeThePurchase => tr("complete_the_purchase");

  String get goToCart => tr("goToCart");

//TODO: Register
}
