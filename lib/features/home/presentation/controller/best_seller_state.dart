part of 'best_seller_cubit.dart';

@immutable
sealed class BestSellerState {}

final class BestSellerInitial extends BestSellerState {}

final class BestSellerloading extends BestSellerState {}

final class productModelloading extends BestSellerState {}

final class BestSellerModelloading extends BestSellerState {}

final class BestSellersuccess extends BestSellerState {}

final class BestSellerproductSuccess extends BestSellerState {}

final class productModelSuccess extends BestSellerState {}

final class SilderSuccess extends BestSellerState {}

final class SilderLoding extends BestSellerState {}

final class BestSellerfailure extends BestSellerState {}

final class setSizeproductSuccess extends BestSellerState {}
