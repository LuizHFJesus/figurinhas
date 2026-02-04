import 'package:sticker_manager_wc22/domain/models/group.dart';
import 'package:sticker_manager_wc22/domain/models/section.dart';

class GroupSections {
  final Group group;
  final List<Section> sections;

  const GroupSections({
    required this.group,
    required this.sections,
  });
}
