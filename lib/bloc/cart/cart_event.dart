abstract class CartEvent {}

class GetAllCartEvent extends CartEvent {}

class AddCartEvent extends CartEvent {
  final int productId;
  AddCartEvent(this.productId);
}

class RemoveCartEvent extends CartEvent {
  final int cartId;
  RemoveCartEvent(this.cartId);
}

class ChangeCountCartEvent extends CartEvent {
  final int cartId;
  final int count;
  ChangeCountCartEvent(this.cartId, this.count);
}
