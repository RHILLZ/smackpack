import 'package:get/get.dart';
import 'package:smackpack/bindings/initial_binding.dart';
import 'package:smackpack/data/models/product.dart';
import 'package:smackpack/views/admin/add_product.dart';
import 'package:smackpack/views/admin/admin_view.dart';
import 'package:smackpack/views/admin/auth_view.dart';
import 'package:smackpack/views/admin/edit_product.dart';
import 'package:smackpack/views/contactView.dart';
import 'package:smackpack/views/detailView.dart';
import 'package:smackpack/views/enterView.dart';
import 'package:smackpack/views/locationChoiceView.dart';
import 'package:smackpack/views/mainView.dart';

part 'routes.dart';

final Product _initialProduct = Product(
    strainName: '',
    strainType: '',
    effectLevel: 0,
    thcLevel: '',
    cbdLevel: '',
    quarterPrice: '',
    halfPrice: '',
    ozPrice: '',
    isInStock: false);

class Views {
  Views._();

  static const enterView = Routes.enterViewRoute;
  static const locationChoiceView = Routes.locationChoiceViewRoute;

  //admin
  static const adminView = Routes.adminViewRoute;
  static const authView = Routes.authViewRoute;

  static final routes = [
    GetPage<EnterAppView>(
        name: Routes.enterViewRoute,
        page: () => const EnterAppView(),
        binding: InitialBinding()),
    GetPage<LocationChoiceView>(
        name: Routes.locationChoiceViewRoute,
        page: () => const LocationChoiceView(),
        binding: InitialBinding()),
    GetPage<MainView>(
        name: Routes.mainViewRoute,
        page: () => MainView(),
        binding: InitialBinding()),
    GetPage<DetailView>(
        name: Routes.detailViewRoute,
        page: () => DetailView(
              product: _initialProduct,
            ),
        binding: InitialBinding()),
    GetPage<ContactView>(
        name: Routes.contactViewRoute,
        page: () => ContactView(),
        binding: InitialBinding()),
    GetPage<AddProductView>(
        name: Routes.addProductViewRoute,
        page: () => const AddProductView(),
        binding: InitialBinding()),
    GetPage<AdminView>(
        name: Routes.adminViewRoute,
        page: () => const AdminView(),
        binding: InitialBinding()),
    GetPage<EditProductView>(
        name: Routes.editProductViewRoute,
        page: () => EditProductView(product: _initialProduct),
        binding: InitialBinding()),
    GetPage<AuthView>(
        name: Routes.authViewRoute,
        page: () => const AuthView(),
        binding: InitialBinding()),
  ];
}
