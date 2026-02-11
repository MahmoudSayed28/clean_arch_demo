import 'package:dartz/dartz.dart';
import 'package:demo/core/errors/failure.dart';
import 'package:demo/features/student_feature/domain/entities/student_entity.dart';
import 'package:demo/features/student_feature/domain/repos/student_repo.dart';

class GetStudentUseCase {
  final StudentRepository repository;

  GetStudentUseCase(this.repository);

  Future<Either<Failure, StudentEntity?>> call(int id) async {
    return await repository.getStudent(id);
  }
}
