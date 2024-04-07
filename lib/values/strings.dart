import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

/// Project SLM_Wallet
/// Created by sahan on 11/17/21 13:29

enum Flavor { DEV, UAT, QA, PRODUCTION }

enum KeyBoardType { NUM_ONLY, NUM, TEXT, EMAIL, TELEPHONE }

enum ValidationType {
  NIC,
  MOBILE,
  TELEPHONE,
  PASSWORD,
  EMAIL,
  NORMAL,
  REPEAT_PASSWORD,
  AMOUNT,
  ONLY_LETTERS,
  ONLY_NUMBERS,
  OTHER_NAME,
  EXPIRE_DATE,
  DATE,
  TEXT_NOT_REQUIRED,
  QRAMOUNT
}

enum Frequency {
  DAILY,
  WEEKLY,
  MONTHLY,
  QUARTERLY,
  YEARLY,
}

enum contactValidationTypes {
  AIRTEL,
  MTN,
  ALL,
}

enum SupportState {
  unknown,
  supported,
  unsupported,
}

enum SearchType {
  BANK,
  BRANCH,
  TITLES,
  MARITAL_STATUS,
  CITY,
  EMP_GROUP,
  OCCUPATION,
  MAIN_SECTOR,
  EMP_NAME,
  AVG_MONTHLY_INCOME,
  SOURCE_OF_FUNDS,
  EXPECTED_TURNOVER,
  PREFERRED_BRANCH,
  ACCOUNT_OPENING_REASON
}

enum ParentPage {
  REGISTER,
  LOGIN,
  HOME,
  FORGOT_PASSWORD,
  OWN_TRANSFER_CONFIRM,
  SEND_MONEY,
  VERIFY_MOBILE,
  ADD_ACC,
  ADD_CARD,
  LOGIN_BIO,
  BANK,
  FORGOT_USER_ID,
  BILL_PAY,
  SCHEDULE_BILL_PAY,
  POST_LOGIN_RESET_PASSWORD,
  LOGIN_FORCE_PASSWORD,
  LOGIN_FORCE_PASSWORD_WITH_NEW_DEVICE,
  REGISTER_STEP_2,
  MORE_SCREEN,
  MY_PROFILE,
  ACCOUNT_VERIFICATION,
  WELCOME,
  CHURCH,
  FUNDRAISING,
  loanOtp,
  SAVED_PAYEE,
}

enum FieldStatus {
  Validated,
  Validating,
  Invalid,
}

///payment types
enum TransactionType {
  OWN_ACCOUNT,
  INTRABANK,
  INTERBANK_INSTAPAY,
  INTERBANK_PESONET,
  INTERBANK_RTGS,
  INTERBANK_PDDTS,
  INTERBANK_SWIFT,
  BILL_PAYMENT,
}

/// Enum to specify which Dynamic Bills Payment Screen to enter
enum DynamicBillScreen {
  /// Bill Payment Screen: is the actual bills payment screen
  billPaymentScreen,

  /// Add Favorite Bill Screen: is the creation of new saved/favorite bills payment screen
  addFavoriteBillScreen,

  /// Update Favorite Bill Screen: is the update screen for the saved/favorite bills payment
  updateFavoriteBillScreen,
}

/// Enum to identify Biller Validate State
enum BillerValidateState {
  timeOut,
  invalid,
  valid,
  notValidated,
}

FilteringTextInputFormatter currencyRegexInputFormatter =
    FilteringTextInputFormatter.allow(
  RegExp(
    r'(^[^\D]\d*\.?\d{0,2})',
  ),
);

/// format amount in the 'Amount' textfield to proper currency format
void formatAmountToCurrencyFormat(TextEditingController amountController) {
  // currency formatter
  NumberFormat _amountFormat =
      NumberFormat.simpleCurrency(locale: "en_US", name: 'UGX ');

  // 'P' is referring to the first letter of the 'PHP' currency symbol
  // if it has a 'PHP' currency symbol, then the amount is parsed
  // if not, parse the amount to the correct format then proceed to next screen
  if (amountController.text[0] != 'P') {
    amountController.text =
        _amountFormat.format(double.parse(amountController.text));
  }
}

class AppStrings {
  ///Environments

  ///DEV UGA
  ///
  static const UGA_DEV_Url =
      "https://ipaydev.centenarybank.co.ug/iwallet-api-gateway/";

  static const UGA_DEV_baseUrl = UGA_DEV_Url;
  static const UGA_DEV_uga_baseUrl = UGA_DEV_Url + "uga-service";
  static const UGA_DEV_bankBasePath = UGA_DEV_Url + "slf-service";
  static const UGA_DEV_authServerBasePath = UGA_DEV_Url + "auth-server";
  static const UGA_DEV_kycServiceBasePath = UGA_DEV_Url + "kyc-service";

  ///QA
  static const UGA_QA_Url =
      "https://switchqa.centenarybank.co.ug/iwallet-api-gateway/";

  static const UGA_QA_baseUrl = UGA_QA_Url;
  static const UGA_QA_uga_baseUrl = UGA_QA_Url + "uga-service";
  static const UGA_QA_bankBasePath = UGA_QA_Url + "slf-service";
  static const UGA_QA_authServerBasePath = UGA_QA_Url + "auth-server";
  static const UGA_QA_kycServiceBasePath = UGA_QA_Url + "kyc-service";

  ///UAT
  ///
  static const UGA_UAT_Url =
      "https://switchuat.centenarybank.co.ug/iwallet-api-gateway/";

  static const UGA_UAT_baseUrl = UGA_UAT_Url;
  static const UGA_UAT_uga_baseUrl = UGA_UAT_Url + "uga-service";
  static const UGA_UAT_bankBasePath = UGA_UAT_Url + "slf-service";
  static const UGA_UAT_authServerBasePath = UGA_UAT_Url + "auth-server";
  static const UGA_UAT_kycServiceBasePath = UGA_UAT_Url + "kyc-service";

  ///PRODUCTION
  ///
  static const UGA_PROD_Url =
      "https://ipayprod.centenarybank.co.ug/iwallet-api-gateway/";

  static const UGA_PROD_baseUrl = UGA_PROD_Url;
  static const UGA_PROD_uga_baseUrl = UGA_PROD_Url + "uga-service";
  static const UGA_PROD_bankBasePath = UGA_PROD_Url + "slf-service";
  static const UGA_PROD_authServerBasePath = UGA_PROD_Url + "auth-server";
  static const UGA_PROD_kycServiceBasePath = UGA_PROD_Url + "kyc-service";

  static const CLIENT_ID =  kIsWeb? "ugaretail": "1133222";
  static const CLIENT_SECRET =  kIsWeb? "df520f7cf10e68b5e9a04e85577ca4ss" :"df520f7cf10e68b5e9a04e85577ca4ee";

  ///CTBC
  static const START_STORAGE_HELPER = "START_STORAGE_HELPER";
  static const IV_KEY = "iwalletsampathlk";
  static const TERMS_AND_CONDITIONS = "TERMS_AND_CONDITIONS";
  static const DATA_PRIVACY_POLICY = "DATA_PRIVACY_POLICY";
  static const RETAIL_TERMS_AND_CONDITIONS = "RETAIL_TERMS_AND_CONDITIONS";
  static const RETAIL_DATA_PRIVACY_POLICY = "RETAIL_DATA_PRIVACY_POLICY";
  static const FCM_TOKEN = "FCM_TOKEN";
  static const SESSION_ID = "SESSION_ID";
  static const REFRESH_TOKEN = "REFRESH_TOKEN";
  static const TOKEN = "TOKEN";
  static const NIC = "NIC";
  static const FORCED_PASSWORD_OLD = "FORCED_PASSWORD_OLD";
  static const FORCED_PASSWORD_NEW = "FORCED_PASSWORD_NEW";
  static const String LOGIN_USER = "LOGIN_USER";
  static const String LOGIN_ONBOARD_USER = "LOGIN_ONBOARD_USER";
  static const String USER_TYPE = "IBNK";
  static const String OTP_MODE = "email";

  // static const String CREDENTIAL_MODE = "username";
  static const String CREDENTIAL_MODE = "mobile";

  ///Configurations
  ///
  static const FREQUENT_BILLERS = "frequentBillers";

  ///Transactions Types
  static const ACCOUNT_TRAN_TYPE = "account";
  static const WALLET_TRAN_TYPE = "wallet";
  static const CARD_TRAN_TYPE = "card";

  ///Location Data
  static const LOCATION_DATA = "location-data";

  ///CENT
  static const TEMP_MOBILE_NUMBER = "tempmobilenumber";
  static const CENT_MOBILE_NUMBER = "centmobilenumber";
  static const CENT_NIN_NUMBER = "centninnumber";
  static const CENT_OTP_PURPOSE = "wallet-mobile-verification";
  static const CENT_REF_ID = "ref_id";
  static const CENT_USER_LOCKED = "user-locked";

  ///CTBC
  static const CTBC_ACCOUNT_NUMBER = "ctbcAccountNumber";
  static const CTBC_WALLET_CARDS_AND_ACCOUNT_BALANCES =
      "ctbcWalletCardsAndAccountBalances";
  static const CTBC_USER_ID = "ctbcUserId";
  static const CTBC_PASSWORD_POLICY_JSON = "ctbcPasswordPolicyJson";
  static const CTBC_LOGIN_RESPONSE = 'ctbcLoginResponse';
  static const CTBC_SEND_MONEY_ARGUMENT = 'ctbcSendMoneyArgument';
  static const CTBC_PRE_LOGIN_SESSION_ID = "currentPreLoginSessionID";
  static const PENDING_TRANSACTION_ID = "postLoginPendingTransactionID";
  static const CTBC_CURRENT_PAYEE_ID = "currentPayeeID";
  static const CTBC_CURRENT_SCHEDULED_TRANSACTION_ID =
      "currentScheduledTransactionID";
  static const CTBC_SEND_MONEY_FEE = 'ctbcSendMoneyFee';
  static const CTBC_SEND_MONEY_TOTAL = 'ctbcSendMoneyTotal';

  static const REGISTERED_MOBILE = "registeredMobile";
  static const LOGIN_MOBILE = "loginMobile";
  static const CTBC_PROFILE_PHOTO = "ctbcProfilePhoto";
  static const CTBC_LAST_ACTIVE_DATE = "ctbcLastActiveDate";
  static const CTBC_PASSWORD_EXPIRY_DATE = "ctbcPasswordExpiryDate";
  static const CTBC_FILTER_TRANSACTION_ARGUMENT =
      'ctbcFilterTransactionArgument';
  static const PRIMARY_ACCOUNT = 'primaryAccount';
  static const DYNAMIC_LINK = 'dynamicLink';
}
