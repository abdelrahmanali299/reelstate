import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService {
  final supabase = Supabase.instance.client;

  // إضافة بيانات إلى Supabase
  Future<void> addData(
    String mainPath,
    Map<String, dynamic> data, {
    String? id,
  }) async {
    try {
      if (id != null) {
        data['id'] = id; // لو عايز تضيف id للبيانات
      }
      final response = await supabase.from(mainPath).insert(data);
      print('Data added: $response');
    } catch (e) {
      print('Error adding data: $e');
    }
  }

  // جلب البيانات من Supabase
  Future<List<Map<String, dynamic>>> getData(String mainPath) async {
    try {
      final res = await supabase.from(mainPath).select('*');
      return List<Map<String, dynamic>>.from(res);
    } catch (e) {
      print('Error fetching data: $e');
      return [];
    }
  }

  Future<void> updateData(
    String mainPath,
    String id, // الـ id للصف اللي عايز تحدثه
    Map<String, dynamic> data,
  ) async {
    try {
      final response = await supabase.from(mainPath).update(data).eq('id', id);
      print('Data updated: $response');
    } catch (e) {
      print('Error updating data: $e');
    }
  }
}
