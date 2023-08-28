import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:laundrynet_mobile_frontend/view/camera_picker/camera_picker_view.dart';
import 'package:laundrynet_mobile_frontend/view/employee_attedance_list/employee_attedance_list_owner_view.dart';
import 'package:laundrynet_mobile_frontend/view/owner_oultetes_list/owner_outletes_list_screen.dart';
import 'package:laundrynet_mobile_frontend/view/status_tracking/status_tracking_view.dart';

import '../../view/about_app_version/about_app_version_view.dart';
import '../../view/bank_account_form/bank_account_form_view.dart';
import '../../view/chat_list/chat_list_view.dart';
import '../../view/chat_room/chat_room_view.dart';
import '../../view/commission_transaction_history_join/commission_transaction_history_join_view.dart';
import '../../view/complain_detail/complain_detail_customer.dart';
import '../../view/complain_detail/complain_detail_owner.dart';
import '../../view/complain_discussion_join/complain_discussion_join_view.dart';
import '../../view/complain_list_view/complain_list_customer_view.dart';
import '../../view/complain_list_view/complain_list_owner_view.dart';
import '../../view/complain_form/complain_form_view.dart';
import '../../view/complain_status_tracking/complain_status_tracking_view.dart';
import '../../view/credit_card_form/credit_card_edit_view.dart';
import '../../view/credit_card_form/credit_card_form_view.dart';
import '../../view/credit_card_list/credit_card_list_view.dart';
import '../../view/customer_detail/customer_detail_view.dart';
import '../../view/customer_filter/customer_filter_view.dart';
import '../../view/customer_list/customer_list_view.dart';
import '../../view/date_time_picker/date_time_picker_view.dart';
import '../../view/delete_user_account_confirmation/delete_user_account_confirmation_view.dart';
import '../../view/employee_attedance_detail/employee-attedance_detail_owner_view.dart';
import '../../view/employee_attedance_detail/employee_attedance_detail_employee_view.dart';
import '../../view/employee_attedance_list/employee_attedance_list_employee_view.dart';
import '../../view/favorite_outlet_list/favorite_outlet_list.dart';
import '../../view/filter_screen/filter_screen_view.dart';
import '../../view/forgot_password/forgot_password_view.dart';
import '../../view/image_viewer/image_viewer.dart';
import '../../view/item_order_activtity_progress_tracker/item_order_activity_done_tracker_view.dart';
import '../../view/item_order_activtity_progress_tracker/item_order_activity_progress_tracker.dart';
import '../../view/journal/journal_view.dart';
import '../../view/login/login_view.dart';
import '../../view/map_viewer/map_viewer_view.dart';
import '../../view/modal/modal.dart';
import '../../view/notification_detail/notification_detail_view.dart';
import '../../view/notification_list/notification_list_view.dart';
import '../../view/notification_setting/notification_setting_customer_view.dart';
import '../../view/notification_setting/notification_setting_employee_view.dart';
import '../../view/notification_setting/notification_setting_owner_view.dart';
import '../../view/onboarding/onboarding_view.dart';
import '../../view/order_cancellation_reason/order_cancellation_reason_view.dart';
import '../../view/order_confirmation/order_failed_confirmation_view.dart';
import '../../view/order_confirmation/order_success_confirmation_view.dart';
import '../../view/order_delivery_tracking_map/order_delivery_tracking_map_customer_view.dart';
import '../../view/order_delivery_tracking_map/order_delivery_tracking_map_owner_view.dart';
import '../../view/order_list/order_list_customer.dart';
import '../../view/order_list/order_list_owner.dart';
import '../../view/order_loading/order_loading_view.dart';
import '../../view/order_status/order_status_view.dart';
import '../../view/outlet_details/outlet_details_owner_view.dart';
import '../../view/outlet_details/outlet_details_public_view.dart';

import '../../view/outlet_order_detail/outlet_order_detail_cashier_view.dart';
import '../../view/outlet_order_detail/outlet_order_detail_finish_view.dart';
import '../../view/outlet_order_detail/outlet_order_detail_owner_view.dart';
import '../../view/outlet_order_detail/outlet_order_detail_courier_view.dart';
import '../../view/outlet_order_detail/outlet_order_detail_pickup_view.dart';
import '../../view/outlet_order_detail/outlet_order_detail_process_view.dart';
import '../../view/outlet_order_detail/outlet_order_detail_production_view.dart';
import '../../view/outlet_order_form/outler_order_form_customer_view.dart';
import '../../view/outlet_order_form/outlet_order_form_owner_view.dart';
import '../../view/platform_wallet/platform_wallet_view.dart';
import '../../view/platform_wallet_withdrawal/platform_wallet_withdrawal_view.dart';
import '../../view/privacy_policy/privacy_policy_view.dart';
import '../../view/promo_list/promo_list_owner_view.dart';
import '../../view/promo_list/promo_list_public_view.dart';
import '../../view/qr_barcode_scanner_joinscreen/qr_barcode_scanner_Joinscreen_view.dart';
import '../../view/qr_payment/qr_payment_view.dart';
import '../../view/register/register_view.dart';
import '../../view/review/review_view.dart';
import '../../view/salary_transaction_history_join/salary_transaction_history_join.dart';
import '../../view/search_result/search_results_view.dart';
import '../../view/select_item_order/select_item_order_view.dart';
import '../../view/select_order_type/select_order_type_view.dart';
import '../../view/select_payment_method/select_payment_method_customer_view.dart';
import '../../view/select_payment_method/select_payment_method_owner_view.dart';
import '../../view/select_service/select_service_view.dart';
import '../../view/splash/splash_view.dart';
import '../../view/terms_condition/terms_condition_view.dart';
import '../../view/user_address_form/user_address_form_view.dart';
import '../../view/user_address_list/user_address_list_view.dart';

import '../../view/user_profile/user_profile_customer_view.dart';
import '../../view/user_profile/user_profile_employee.dart';
import '../../view/user_profile_form_join/user_profile_form_join_view.dart';
import '../../view/whatsapp_verification/whatsapp_verification_view.dart';

class AppRoutes {
  AppRoutes._();
  static Map<String, WidgetBuilder> routes = {
    SearchResultView.routeName: (context) => const SearchResultView(),
    StatusTrackingView.routeName: (context) => const StatusTrackingView(),
    FilterScreenView.routeName: (context) => const FilterScreenView(),
    SplashView.routeName: (context) => const SplashView(),
    OnboardingView.routeName: (context) => const OnboardingView(),
    LoginView.routeName: (context) => const LoginView(),
    RegisterView.routeName: (context) => const RegisterView(),
    ForgotPasswordView.routeName: (context) => const ForgotPasswordView(),
    WhatsappVerificationView.routeName: (context) => const WhatsappVerificationView(),
    TermsConditionView.routeName: (context) => const TermsConditionView(),
    PrivacyPolicyView.routeName: (context) => const PrivacyPolicyView(),
    DateTimePickerView.routeName: (context) => const DateTimePickerView(),
    QRPaymentView.routeName: (context) => const QRPaymentView(),
    ChatListView.routeName: (context) => const ChatListView(),
    ChatRoomView.routeName: (context) => const ChatRoomView(),
    ComplainListOwnerView.viewAsOwner: (context) => const ComplainListOwnerView(),
    ComplainListCustomerView.viewAsCustomer: (context) => const ComplainListCustomerView(),
    ComplainFormView.routeName: (context) => const ComplainFormView(),
    ComplainDetailOwnerView.viewAsOwner: (context) => const ComplainDetailOwnerView(),
    ComplainDetailCustomerView.viewAsCustomer: (context) => const ComplainDetailCustomerView(),
    ComplainStatusTrackingView.routeName: (context) => const ComplainStatusTrackingView(),
    ComplainDiscussionJoinView.routeName: (context) => const ComplainDiscussionJoinView(),
    SelectItemOrderView.routeName: (context) => const SelectItemOrderView(),
    UserProfileFormJoinView.routeName: (context) => const UserProfileFormJoinView(),
    UserProfileCustomerView.viewAsCustomer: (context) => const UserProfileCustomerView(),
    UserProfileEmployeeView.viewAsEmployee: (context) => const UserProfileEmployeeView(),
    PlatformWalletView.routeName: (context) => const PlatformWalletView(),
    SalaryTransactionHistoryJoinView.routeName: (context) => const SalaryTransactionHistoryJoinView(),
    CommissionTransactionHistoryJoinView.routeName: (context) => const CommissionTransactionHistoryJoinView(),
    FavoriteOutletListView.routeName: (context) => const FavoriteOutletListView(),
    UserAddressListView.routeName: (context) => const UserAddressListView(),
    UserAddressFormView.routeName: (context) => const UserAddressFormView(),
    MapViewerView.routeName: (context) => const MapViewerView(),
    OwnerOutletesListView.routeName: (context) => const OwnerOutletesListView(),
    ImageViewerView.routeName: (context) => const ImageViewerView(),
    SelectOrderTypeView.routeName: (context) => const SelectOrderTypeView(),
    SelectServiceView.routeName: (context) => const SelectServiceView(),
    OrderListOwnerView.viewAsOwner: (context) => const OrderListOwnerView(),
    OrderListCustomerView.viewAsCustomer: (context) => const OrderListCustomerView(),
    OutletOrderFormOwnerView.viewAsOwner: (context) => const OutletOrderFormOwnerView(),
    OutletOrderFormCustomerView.viewAsCustomer: (context) => const OutletOrderFormCustomerView(),
    OutletOrderDetailOwnerView.viewAsOwner: (context) => const OutletOrderDetailOwnerView(),
    OutletOrderDetailCourierView.viewAsEmployee: (context) => const OutletOrderDetailCourierView(),
    OutletOrderDetailCashierView.viewAsEmployee: (context) => const OutletOrderDetailCashierView(),
    OutletOrderDetailProductionView.viewAsEmployee: (context) => const OutletOrderDetailProductionView(),
    OutletOrderDetailPickupView.viewAsCustomer: (context) => const OutletOrderDetailPickupView(),
    OutletOrderDetailProcessView.viewAsCustomer: (context) => const OutletOrderDetailProcessView(),
    OutletOrderDetailFinishView.viewAsCustomer: (context) => const OutletOrderDetailFinishView(),
    OrderStatusView.routeName: (context) => const OrderStatusView(),
    OrderDeliveryTrackingMapCustomerView.viewAsCustomer: (context) => const OrderDeliveryTrackingMapCustomerView(),
    OrderDeliveryTrackingMapOwnerView.viewAsOwner: (context) => const OrderDeliveryTrackingMapOwnerView(),
    PromoListOwnerView.viewAsOwner: (context) => const PromoListOwnerView(),
    PromoListPublicView.viewAsPublic: (context) => const PromoListPublicView(),
    ItemOrderActivityProgressTrackerView.routeName: (context) => const ItemOrderActivityProgressTrackerView(),
    ItemOrderActivityDoneTrackerView.routeName: (context) => const ItemOrderActivityDoneTrackerView(),
    OrderCancellationReasonView.routeName: (context) => const OrderCancellationReasonView(),
    NotificationListView.routeName: (context) => const NotificationListView(),
    NotificationDetailView.routeName: (context) => const NotificationDetailView(),
    NotificationSettingOwnerView.viewAsOwner: (context) => const NotificationSettingOwnerView(),
    NotificationSettingEmployeeView.viewAsEmployee: (context) => const NotificationSettingEmployeeView(),
    NotificationSettingCustomerView.viewAsCustomer: (context) => const NotificationSettingCustomerView(),
    AboutAppVersionView.routeName: (context) => const AboutAppVersionView(),
    DeleteUserAccountConfirmationView.routeName: (context) => const DeleteUserAccountConfirmationView(),
    SelectPaymentMethodOwnerView.viewAsOwner: (context) => const SelectPaymentMethodOwnerView(),
    SelectPaymentMethodCustomerView.viewAsCustomer: (context) => const SelectPaymentMethodCustomerView(),
    CreditCardListView.routeName: (context) => const CreditCardListView(),
    CreditCardFormView.routeName: (context) => const CreditCardFormView(),
    CreditCardEditView.routeName: (context) => const CreditCardEditView(),
    BankAccountFormView.routeName: (context) => const BankAccountFormView(),
    EmployeeAttedanceListOwnerView.viewAsOwner: (context) => const EmployeeAttedanceListOwnerView(),
    EmployeeAttedanceListEmployeeView.viewAsEmployee: (context) => const EmployeeAttedanceListEmployeeView(),
    EmployeeAttedanceDetailOwnerView.viewAsOwner: (context) => const EmployeeAttedanceDetailOwnerView(),
    EmployeeAttedanceDetailEmployeeView.viewAsEmployee: (context) => const EmployeeAttedanceDetailEmployeeView(),
    CustomerListView.routeName: (context) => const CustomerListView(),
    CustomerFilterView.routeName: (context) => const CustomerFilterView(),
    CustomerDetailView.routeName: (context) => const CustomerDetailView(),
    ReviewView.routeName: (context) => const ReviewView(),
    PlatformWalletWithdrawalView.routeName: (context) => const PlatformWalletWithdrawalView(),
    JournalView.routeName: (context) => const JournalView(),
    OutletDetailsOwnerView.viewAsOwner: (context) => const OutletDetailsOwnerView(),
    OutletDetailsPublicView.viewAsPublic: (context) => const OutletDetailsPublicView(),
    QRBarcodeScannerJoinscreen.routeName: (context) => const QRBarcodeScannerJoinscreen(),
    CameraPickerView.routeName: (context) => const CameraPickerView(),
    ModalView.routeName: (context) => const ModalView(),
    OrderLoadingView.routeName: (context) => const OrderLoadingView(),
    OrderSuccessConfirmationView.routeName: (context) => const OrderSuccessConfirmationView(),
    OrderFailedConfirmationView.routeName: (context) => const OrderFailedConfirmationView(),
  };
}
