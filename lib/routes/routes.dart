part of 'views.dart';

abstract class Routes {
  Routes._();

  static const enterViewRoute = '/enter_view';
  static const locationChoiceViewRoute = '/location_choice_view';
  static const mainViewRoute = '/main_view';
  static const detailViewRoute = '/detail_view';
  static const contactViewRoute = '/contact_view';

  //admin
  static const adminViewRoute = '/admin_view';
  static const addProductViewRoute = '/add_product_view';
  static const editProductViewRoute = '/edit_product_view';
  static const authViewRoute = '/auth_view';
}
