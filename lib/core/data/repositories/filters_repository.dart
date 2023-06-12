import 'package:polaris/core/domain/model/general.dart';
import 'package:polaris/core/util/helper/json_helper.dart';

class FiltersRepository {
  Future<List<FilterSortData>> getFilters(String name) async {
    final Map<String, dynamic> data = await JsonHelper.readJson("filters");
    final List<dynamic> list = data[name]['filters'];

    return list.map((e) => FilterSortData.fromJson(e)).toList();
  }

  Future<List<FilterSortData>> getSorts(String name) async {
    final Map<String, dynamic> data = await JsonHelper.readJson("filters");
    final List<dynamic> list = data[name]['sorts'];

    return list.map((e) => FilterSortData.fromJson(e)).toList();
  }
}
