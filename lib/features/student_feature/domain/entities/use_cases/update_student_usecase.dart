import 'package:dartz/dartz.dart';
import 'package:demo/core/errors/failure.dart';
import 'package:demo/features/student_feature/domain/entities/student_entity.dart';
import 'package:demo/features/student_feature/domain/repos/student_repo.dart';

class UpdateStudentUseCase {
  final StudentRepository repository;

  UpdateStudentUseCase(this.repository);

  Future<Either<Failure, void>> call(StudentEntity student) async {
    return await repository.updateStudent(student);
  }
}
