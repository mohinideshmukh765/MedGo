import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class SupabaseService {
  static SupabaseService? _instance;
  static SupabaseClient? _client;

  SupabaseService._();

  static SupabaseService get instance {
    _instance ??= SupabaseService._();
    return _instance!;
  }

  static Future<void> initialize() async {
    await dotenv.load(fileName: ".env");

    final supabaseUrl = dotenv.env['VITE_SUPABASE_URL'] ?? '';
    final supabaseAnonKey = dotenv.env['VITE_SUPABASE_ANON_KEY'] ?? '';

    if (supabaseUrl.isEmpty || supabaseAnonKey.isEmpty) {
      throw Exception('Supabase credentials not found in .env file');
    }

    await Supabase.initialize(
      url: supabaseUrl,
      anonKey: supabaseAnonKey,
    );

    _client = Supabase.instance.client;
  }

  SupabaseClient get client {
    if (_client == null) {
      throw Exception('Supabase not initialized. Call SupabaseService.initialize() first.');
    }
    return _client!;
  }

  User? get currentUser => _client?.auth.currentUser;

  bool get isLoggedIn => currentUser != null;

  Future<AuthResponse> signUp({
    required String email,
    required String password,
    required String fullName,
    required String role,
    String? phone,
  }) async {
    final response = await _client!.auth.signUp(
      email: email,
      password: password,
      data: {
        'full_name': fullName,
        'role': role,
        'phone': phone,
      },
    );

    if (response.user != null) {
      await _client!.from('users').insert({
        'id': response.user!.id,
        'email': email,
        'role': role,
        'full_name': fullName,
        'phone': phone,
      });
    }

    return response;
  }

  Future<AuthResponse> signIn({
    required String email,
    required String password,
  }) async {
    return await _client!.auth.signInWithPassword(
      email: email,
      password: password,
    );
  }

  Future<void> signOut() async {
    await _client!.auth.signOut();
  }

  Future<Map<String, dynamic>?> getUserProfile(String userId) async {
    final response = await _client!
        .from('users')
        .select()
        .eq('id', userId)
        .maybeSingle();
    return response;
  }

  Future<List<Map<String, dynamic>>> getMedicines({String? category}) async {
    var query = _client!.from('medicines').select().eq('is_active', true);

    if (category != null && category.isNotEmpty) {
      query = query.eq('category', category);
    }

    return await query;
  }

  Future<void> addToCart({
    required String buyerId,
    required String medicineId,
    required int quantity,
  }) async {
    await _client!.from('cart_items').upsert({
      'buyer_id': buyerId,
      'medicine_id': medicineId,
      'quantity': quantity,
    });
  }

  Future<List<Map<String, dynamic>>> getCartItems(String buyerId) async {
    return await _client!
        .from('cart_items')
        .select('*, medicines(*)')
        .eq('buyer_id', buyerId);
  }

  Future<void> removeFromCart(String cartItemId) async {
    await _client!.from('cart_items').delete().eq('id', cartItemId);
  }

  Future<void> createOrder({
    required String buyerId,
    required String sellerId,
    required double totalAmount,
    required String deliveryAddress,
    required List<Map<String, dynamic>> items,
  }) async {
    final orderResponse = await _client!.from('orders').insert({
      'buyer_id': buyerId,
      'seller_id': sellerId,
      'total_amount': totalAmount,
      'delivery_address': deliveryAddress,
      'status': 'pending',
    }).select().single();

    final orderId = orderResponse['id'];

    for (var item in items) {
      await _client!.from('order_items').insert({
        'order_id': orderId,
        'medicine_id': item['medicine_id'],
        'quantity': item['quantity'],
        'price': item['price'],
      });
    }

    await _client!.from('cart_items').delete().eq('buyer_id', buyerId);
  }

  Future<List<Map<String, dynamic>>> getOrders(String userId, String role) async {
    if (role == 'buyer') {
      return await _client!
          .from('orders')
          .select('*, order_items(*, medicines(*))')
          .eq('buyer_id', userId)
          .order('created_at', ascending: false);
    } else {
      return await _client!
          .from('orders')
          .select('*, order_items(*, medicines(*))')
          .eq('seller_id', userId)
          .order('created_at', ascending: false);
    }
  }

  Future<void> addMedicine({
    required String sellerId,
    required String name,
    required String manufacturer,
    required String description,
    required String category,
    required int stripSize,
    required double price,
    required int stockQuantity,
    String? imageUrl,
  }) async {
    await _client!.from('medicines').insert({
      'seller_id': sellerId,
      'name': name,
      'manufacturer': manufacturer,
      'description': description,
      'category': category,
      'strip_size': stripSize,
      'price': price,
      'stock_quantity': stockQuantity,
      'image_url': imageUrl,
      'is_active': true,
    });
  }

  Future<void> updateMedicine(String medicineId, Map<String, dynamic> updates) async {
    await _client!.from('medicines').update(updates).eq('id', medicineId);
  }

  Future<void> deleteMedicine(String medicineId) async {
    await _client!.from('medicines').delete().eq('id', medicineId);
  }

  Future<List<Map<String, dynamic>>> getSellerMedicines(String sellerId) async {
    return await _client!
        .from('medicines')
        .select()
        .eq('seller_id', sellerId)
        .order('created_at', ascending: false);
  }
}
