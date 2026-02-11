import 'package:dartz/dartz.dart';
import 'package:demo/core/errors/failure.dart';
import 'package:demo/features/student_feature/domain/repos/student_repo.dart';

class DeleteStudentUseCase {
  final StudentRepository repository;

  DeleteStudentUseCase(this.repository);

  Future<Either<Failure, void>> call(int id) async {
    return await repository.deleteStudent(id);
  }
}
