// data/models/student_model.dart
import '../../domain/entities/student_entity.dart';

class StudentModel extends StudentEntity {
  final bool isSynced;       
  final int version;          
  final DateTime updatedAt;   

  StudentModel({
    required super.id,
    required super.name,
    required super.phone,
    required super.email,
    this.isSynced = false,
    this.version = 1,
    DateTime? updatedAt,
  }) : updatedAt = updatedAt ?? DateTime.now();

  
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'phone': phone,
      'email': email,
      'is_synced': isSynced ? 1 : 0,
      'version': version,
      'updated_at': updatedAt.toIso8601String(),
    };
  }

  
  factory StudentModel.fromMap(Map<String, dynamic> map) {
    return StudentModel(
      id: map['id'],
      name: map['name'],
      phone: map['phone'],
      email: map['email'],
      isSynced: map['is_synced'] == 1,
      version: map['version'] ?? 1,
      updatedAt: map['updated_at'] != null
          ? DateTime.parse(map['updated_at'])
          : DateTime.now(),
    );
  }
}
