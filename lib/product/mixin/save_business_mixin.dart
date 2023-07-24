import '../../core/constans/cache/locale_keys_enum.dart';
import '../../core/init/cache/local_storage.dart';
import '../../view/auth/login/model/get_business_response_model.dart';

mixin SaveBusinessMixin {
  void saveBusinessInfo(GetBusinessResponseModel response) {
    LocaleStorage.instance
        .setStringValue(LocaleKeys.CURRENCY, response.data.defaultCurrency);

    LocaleStorage.instance
        .setStringValue(LocaleKeys.BUSINESS_NAME, response.data.name);
    LocaleStorage.instance
        .setStringValue(LocaleKeys.RESTAURANT_ID, response.data.id);

    LocaleStorage.instance.setIntValue(
        LocaleKeys.LOCATION_LATITUDE, response.data.location.latitude);
    LocaleStorage.instance.setIntValue(
        LocaleKeys.LOCATION_LONGITUDE, response.data.location.longitude);

    LocaleStorage.instance.setStringValue(
        LocaleKeys.COVER_IMAGE, response.data.profileImage ?? "");

    LocaleStorage.instance.setStringValue(
        LocaleKeys.PHONE_COUNTRY_CODE, response.data.phone.countryCode);

    LocaleStorage.instance.setStringValue(
        LocaleKeys.PHONE_NUMBER, response.data.phone.phoneNumber);
    LocaleStorage.instance.setStringValue(
        LocaleKeys.INSTAGRAM, response.data.socialMedias.instagram);
    LocaleStorage.instance
        .setStringValue(LocaleKeys.THREADS, response.data.socialMedias.threads);
    LocaleStorage.instance.setStringValue(
        LocaleKeys.FACEBOOK, response.data.socialMedias.facebook);

    LocaleStorage.instance
        .setStringValue(LocaleKeys.TWITTER, response.data.socialMedias.twitter);
    LocaleStorage.instance.setStringValue(
        LocaleKeys.WHATSAPP, response.data.socialMedias.whatsapp);
    LocaleStorage.instance
        .setStringValue(LocaleKeys.WEBSITE, response.data.socialMedias.website);
    LocaleStorage.instance.setStringValue(
        LocaleKeys.SUBSCRIPTION_NAME, response.data.purchase?.plan.name ?? "");
    LocaleStorage.instance.setStringValue(LocaleKeys.SUBSCRIPTION_PERIOD,
        response.data.purchase?.periodType ?? "");
    LocaleStorage.instance.setIntValue(
        LocaleKeys.SUBSCRIPTION_PRICE, response.data.purchase?.price ?? 0);
  }
}
