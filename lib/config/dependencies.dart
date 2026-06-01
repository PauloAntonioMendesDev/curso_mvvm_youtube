import 'package:curso_mvvm_youtube/data/repositories/auth/auth_repository.dart';
import 'package:curso_mvvm_youtube/data/repositories/auth/auth_repository_remote.dart';
import 'package:curso_mvvm_youtube/data/repositories/cart/cart_repository.dart';
import 'package:curso_mvvm_youtube/data/repositories/cart/cart_repository_local.dart';
import 'package:curso_mvvm_youtube/data/repositories/product/product_repository.dart';
import 'package:curso_mvvm_youtube/data/repositories/product/product_repository_remote.dart';
import 'package:curso_mvvm_youtube/data/services/api/api_client.dart';
import 'package:curso_mvvm_youtube/data/services/shared_preferences_service.dart';
import 'package:curso_mvvm_youtube/ui/cart/viewmodels/cart_viewmodel.dart';
import 'package:curso_mvvm_youtube/ui/cart_details/viewmodels/cart_details_viewmodel.dart';
import 'package:curso_mvvm_youtube/ui/product/viewmodels/product_viewmodel.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

void setupDependecies() {
  getIt.registerLazySingleton<SharedPreferencesService>(
    () => SharedPreferencesService(),
  );

  getIt.registerSingleton<ApiClient>(
    ApiClient(apiUrl: "https://dummyjson.com", dio: Dio()),
  );

  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryRemote(
      apiClient: getIt(),
      sharedPreferencesService: getIt(),
    ),
  );

  getIt.registerLazySingleton<ProductRepository>(
    () => ProductRepositoryRemote(apiClient: getIt()),
  );

  getIt.registerLazySingleton<CartRepository>(() => CartRepositoryLocal());

  getIt.registerLazySingleton<CartDetailsViewmodel>(
    () => CartDetailsViewmodel(cartRepository: getIt()),
  );

  getIt.registerLazySingleton<CartViewmodel>(
    () => CartViewmodel(cartRepository: getIt()),
  );

  getIt.registerLazySingleton<ProductViewmodel>(
    () => ProductViewmodel(productRepository: getIt()),
  );
}
