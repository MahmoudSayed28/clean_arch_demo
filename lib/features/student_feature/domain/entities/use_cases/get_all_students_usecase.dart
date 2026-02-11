import 'package:dartz/dartz.dart';
import 'package:demo/core/errors/failure.dart';
import 'package:demo/features/student_feature/domain/entities/student_entity.dart';
import 'package:demo/features/student_feature/domain/repos/student_repo.dart';

class GetAllStudentsUseCase {
  final StudentRepository repository;

  GetAllStudentsUseCase(this.repository);

  Future<Either<Failure, List<StudentEntity>>> call() async {
    return await repository.getAllStudents();
  }
}
