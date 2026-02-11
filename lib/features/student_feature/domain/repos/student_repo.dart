import 'package:dartz/dartz.dart';
import 'package:demo/core/errors/failure.dart';
import '../entities/student_entity.dart';

abstract class StudentRepository {
  Future<Either<Failure, void>> addStudent(StudentEntity student);
  Future<Either<Failure, void>> updateStudent(StudentEntity student);
  Future<Either<Failure, void>> deleteStudent(int id);
  Future<Either<Failure, StudentEntity?>> getStudent(int id);
  Future<Either<Failure, List<StudentEntity>>> getAllStudents();
}
