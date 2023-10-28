import '../entities/property.dart';
import '../../data/repositories/property_repository.dart';

class GetPropertiesUseCase {
  final PropertyRepository repository;

  GetPropertiesUseCase({required this.repository});

  Future<List<Property>> execute() async {
   var  prop =  await repository.getProperties();
    print(prop);
    return prop;
  }
}
