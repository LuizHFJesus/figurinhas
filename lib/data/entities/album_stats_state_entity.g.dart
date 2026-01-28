// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'album_stats_state_entity.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetAlbumStatsStateEntityCollection on Isar {
  IsarCollection<AlbumStatsStateEntity> get albumStatsStateEntitys =>
      this.collection();
}

const AlbumStatsStateEntitySchema = CollectionSchema(
  name: r'AlbumStatsStateEntity',
  id: 7980389159053678466,
  properties: {
    r'albumStatsId': PropertySchema(
      id: 0,
      name: r'albumStatsId',
      type: IsarType.string,
    ),
    r'deletedAt': PropertySchema(
      id: 1,
      name: r'deletedAt',
      type: IsarType.dateTime,
    ),
    r'duplicateStickers': PropertySchema(
      id: 2,
      name: r'duplicateStickers',
      type: IsarType.long,
    ),
    r'missingFoils': PropertySchema(
      id: 3,
      name: r'missingFoils',
      type: IsarType.long,
    ),
    r'missingStickers': PropertySchema(
      id: 4,
      name: r'missingStickers',
      type: IsarType.long,
    ),
    r'obtainedFoils': PropertySchema(
      id: 5,
      name: r'obtainedFoils',
      type: IsarType.long,
    ),
    r'obtainedStickers': PropertySchema(
      id: 6,
      name: r'obtainedStickers',
      type: IsarType.long,
    ),
    r'progress': PropertySchema(
      id: 7,
      name: r'progress',
      type: IsarType.double,
    ),
    r'totalFoils': PropertySchema(
      id: 8,
      name: r'totalFoils',
      type: IsarType.long,
    ),
    r'totalStickers': PropertySchema(
      id: 9,
      name: r'totalStickers',
      type: IsarType.long,
    ),
    r'updatedAt': PropertySchema(
      id: 10,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
    r'userAlbumId': PropertySchema(
      id: 11,
      name: r'userAlbumId',
      type: IsarType.string,
    ),
  },

  estimateSize: _albumStatsStateEntityEstimateSize,
  serialize: _albumStatsStateEntitySerialize,
  deserialize: _albumStatsStateEntityDeserialize,
  deserializeProp: _albumStatsStateEntityDeserializeProp,
  idName: r'isarId',
  indexes: {
    r'albumStatsId': IndexSchema(
      id: -5472862288367415757,
      name: r'albumStatsId',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'albumStatsId',
          type: IndexType.hash,
          caseSensitive: true,
        ),
      ],
    ),
    r'userAlbumId': IndexSchema(
      id: -2946282351176265397,
      name: r'userAlbumId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'userAlbumId',
          type: IndexType.hash,
          caseSensitive: true,
        ),
      ],
    ),
    r'updatedAt': IndexSchema(
      id: -6238191080293565125,
      name: r'updatedAt',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'updatedAt',
          type: IndexType.value,
          caseSensitive: false,
        ),
      ],
    ),
  },
  links: {},
  embeddedSchemas: {},

  getId: _albumStatsStateEntityGetId,
  getLinks: _albumStatsStateEntityGetLinks,
  attach: _albumStatsStateEntityAttach,
  version: '3.3.0',
);

int _albumStatsStateEntityEstimateSize(
  AlbumStatsStateEntity object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.albumStatsId.length * 3;
  bytesCount += 3 + object.userAlbumId.length * 3;
  return bytesCount;
}

void _albumStatsStateEntitySerialize(
  AlbumStatsStateEntity object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.albumStatsId);
  writer.writeDateTime(offsets[1], object.deletedAt);
  writer.writeLong(offsets[2], object.duplicateStickers);
  writer.writeLong(offsets[3], object.missingFoils);
  writer.writeLong(offsets[4], object.missingStickers);
  writer.writeLong(offsets[5], object.obtainedFoils);
  writer.writeLong(offsets[6], object.obtainedStickers);
  writer.writeDouble(offsets[7], object.progress);
  writer.writeLong(offsets[8], object.totalFoils);
  writer.writeLong(offsets[9], object.totalStickers);
  writer.writeDateTime(offsets[10], object.updatedAt);
  writer.writeString(offsets[11], object.userAlbumId);
}

AlbumStatsStateEntity _albumStatsStateEntityDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = AlbumStatsStateEntity();
  object.albumStatsId = reader.readString(offsets[0]);
  object.deletedAt = reader.readDateTimeOrNull(offsets[1]);
  object.duplicateStickers = reader.readLong(offsets[2]);
  object.isarId = id;
  object.missingFoils = reader.readLong(offsets[3]);
  object.missingStickers = reader.readLong(offsets[4]);
  object.obtainedFoils = reader.readLong(offsets[5]);
  object.obtainedStickers = reader.readLong(offsets[6]);
  object.progress = reader.readDouble(offsets[7]);
  object.totalFoils = reader.readLong(offsets[8]);
  object.totalStickers = reader.readLong(offsets[9]);
  object.updatedAt = reader.readDateTime(offsets[10]);
  object.userAlbumId = reader.readString(offsets[11]);
  return object;
}

P _albumStatsStateEntityDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    case 5:
      return (reader.readLong(offset)) as P;
    case 6:
      return (reader.readLong(offset)) as P;
    case 7:
      return (reader.readDouble(offset)) as P;
    case 8:
      return (reader.readLong(offset)) as P;
    case 9:
      return (reader.readLong(offset)) as P;
    case 10:
      return (reader.readDateTime(offset)) as P;
    case 11:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _albumStatsStateEntityGetId(AlbumStatsStateEntity object) {
  return object.isarId;
}

List<IsarLinkBase<dynamic>> _albumStatsStateEntityGetLinks(
  AlbumStatsStateEntity object,
) {
  return [];
}

void _albumStatsStateEntityAttach(
  IsarCollection<dynamic> col,
  Id id,
  AlbumStatsStateEntity object,
) {
  object.isarId = id;
}

extension AlbumStatsStateEntityByIndex
    on IsarCollection<AlbumStatsStateEntity> {
  Future<AlbumStatsStateEntity?> getByAlbumStatsId(String albumStatsId) {
    return getByIndex(r'albumStatsId', [albumStatsId]);
  }

  AlbumStatsStateEntity? getByAlbumStatsIdSync(String albumStatsId) {
    return getByIndexSync(r'albumStatsId', [albumStatsId]);
  }

  Future<bool> deleteByAlbumStatsId(String albumStatsId) {
    return deleteByIndex(r'albumStatsId', [albumStatsId]);
  }

  bool deleteByAlbumStatsIdSync(String albumStatsId) {
    return deleteByIndexSync(r'albumStatsId', [albumStatsId]);
  }

  Future<List<AlbumStatsStateEntity?>> getAllByAlbumStatsId(
    List<String> albumStatsIdValues,
  ) {
    final values = albumStatsIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'albumStatsId', values);
  }

  List<AlbumStatsStateEntity?> getAllByAlbumStatsIdSync(
    List<String> albumStatsIdValues,
  ) {
    final values = albumStatsIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'albumStatsId', values);
  }

  Future<int> deleteAllByAlbumStatsId(List<String> albumStatsIdValues) {
    final values = albumStatsIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'albumStatsId', values);
  }

  int deleteAllByAlbumStatsIdSync(List<String> albumStatsIdValues) {
    final values = albumStatsIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'albumStatsId', values);
  }

  Future<Id> putByAlbumStatsId(AlbumStatsStateEntity object) {
    return putByIndex(r'albumStatsId', object);
  }

  Id putByAlbumStatsIdSync(
    AlbumStatsStateEntity object, {
    bool saveLinks = true,
  }) {
    return putByIndexSync(r'albumStatsId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByAlbumStatsId(List<AlbumStatsStateEntity> objects) {
    return putAllByIndex(r'albumStatsId', objects);
  }

  List<Id> putAllByAlbumStatsIdSync(
    List<AlbumStatsStateEntity> objects, {
    bool saveLinks = true,
  }) {
    return putAllByIndexSync(r'albumStatsId', objects, saveLinks: saveLinks);
  }
}

extension AlbumStatsStateEntityQueryWhereSort
    on QueryBuilder<AlbumStatsStateEntity, AlbumStatsStateEntity, QWhere> {
  QueryBuilder<AlbumStatsStateEntity, AlbumStatsStateEntity, QAfterWhere>
  anyIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<AlbumStatsStateEntity, AlbumStatsStateEntity, QAfterWhere>
  anyUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'updatedAt'),
      );
    });
  }
}

extension AlbumStatsStateEntityQueryWhere
    on
        QueryBuilder<
          AlbumStatsStateEntity,
          AlbumStatsStateEntity,
          QWhereClause
        > {
  QueryBuilder<AlbumStatsStateEntity, AlbumStatsStateEntity, QAfterWhereClause>
  isarIdEqualTo(Id isarId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.between(lower: isarId, upper: isarId),
      );
    });
  }

  QueryBuilder<AlbumStatsStateEntity, AlbumStatsStateEntity, QAfterWhereClause>
  isarIdNotEqualTo(Id isarId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: isarId, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: isarId, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: isarId, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: isarId, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<AlbumStatsStateEntity, AlbumStatsStateEntity, QAfterWhereClause>
  isarIdGreaterThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarId, includeLower: include),
      );
    });
  }

  QueryBuilder<AlbumStatsStateEntity, AlbumStatsStateEntity, QAfterWhereClause>
  isarIdLessThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarId, includeUpper: include),
      );
    });
  }

  QueryBuilder<AlbumStatsStateEntity, AlbumStatsStateEntity, QAfterWhereClause>
  isarIdBetween(
    Id lowerIsarId,
    Id upperIsarId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.between(
          lower: lowerIsarId,
          includeLower: includeLower,
          upper: upperIsarId,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<AlbumStatsStateEntity, AlbumStatsStateEntity, QAfterWhereClause>
  albumStatsIdEqualTo(String albumStatsId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(
          indexName: r'albumStatsId',
          value: [albumStatsId],
        ),
      );
    });
  }

  QueryBuilder<AlbumStatsStateEntity, AlbumStatsStateEntity, QAfterWhereClause>
  albumStatsIdNotEqualTo(String albumStatsId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'albumStatsId',
                lower: [],
                upper: [albumStatsId],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'albumStatsId',
                lower: [albumStatsId],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'albumStatsId',
                lower: [albumStatsId],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'albumStatsId',
                lower: [],
                upper: [albumStatsId],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<AlbumStatsStateEntity, AlbumStatsStateEntity, QAfterWhereClause>
  userAlbumIdEqualTo(String userAlbumId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(
          indexName: r'userAlbumId',
          value: [userAlbumId],
        ),
      );
    });
  }

  QueryBuilder<AlbumStatsStateEntity, AlbumStatsStateEntity, QAfterWhereClause>
  userAlbumIdNotEqualTo(String userAlbumId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'userAlbumId',
                lower: [],
                upper: [userAlbumId],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'userAlbumId',
                lower: [userAlbumId],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'userAlbumId',
                lower: [userAlbumId],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'userAlbumId',
                lower: [],
                upper: [userAlbumId],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<AlbumStatsStateEntity, AlbumStatsStateEntity, QAfterWhereClause>
  updatedAtEqualTo(DateTime updatedAt) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'updatedAt', value: [updatedAt]),
      );
    });
  }

  QueryBuilder<AlbumStatsStateEntity, AlbumStatsStateEntity, QAfterWhereClause>
  updatedAtNotEqualTo(DateTime updatedAt) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'updatedAt',
                lower: [],
                upper: [updatedAt],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'updatedAt',
                lower: [updatedAt],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'updatedAt',
                lower: [updatedAt],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'updatedAt',
                lower: [],
                upper: [updatedAt],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<AlbumStatsStateEntity, AlbumStatsStateEntity, QAfterWhereClause>
  updatedAtGreaterThan(DateTime updatedAt, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'updatedAt',
          lower: [updatedAt],
          includeLower: include,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<AlbumStatsStateEntity, AlbumStatsStateEntity, QAfterWhereClause>
  updatedAtLessThan(DateTime updatedAt, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'updatedAt',
          lower: [],
          upper: [updatedAt],
          includeUpper: include,
        ),
      );
    });
  }

  QueryBuilder<AlbumStatsStateEntity, AlbumStatsStateEntity, QAfterWhereClause>
  updatedAtBetween(
    DateTime lowerUpdatedAt,
    DateTime upperUpdatedAt, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'updatedAt',
          lower: [lowerUpdatedAt],
          includeLower: includeLower,
          upper: [upperUpdatedAt],
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension AlbumStatsStateEntityQueryFilter
    on
        QueryBuilder<
          AlbumStatsStateEntity,
          AlbumStatsStateEntity,
          QFilterCondition
        > {
  QueryBuilder<
    AlbumStatsStateEntity,
    AlbumStatsStateEntity,
    QAfterFilterCondition
  >
  albumStatsIdEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'albumStatsId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    AlbumStatsStateEntity,
    AlbumStatsStateEntity,
    QAfterFilterCondition
  >
  albumStatsIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'albumStatsId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    AlbumStatsStateEntity,
    AlbumStatsStateEntity,
    QAfterFilterCondition
  >
  albumStatsIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'albumStatsId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    AlbumStatsStateEntity,
    AlbumStatsStateEntity,
    QAfterFilterCondition
  >
  albumStatsIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'albumStatsId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    AlbumStatsStateEntity,
    AlbumStatsStateEntity,
    QAfterFilterCondition
  >
  albumStatsIdStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'albumStatsId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    AlbumStatsStateEntity,
    AlbumStatsStateEntity,
    QAfterFilterCondition
  >
  albumStatsIdEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'albumStatsId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    AlbumStatsStateEntity,
    AlbumStatsStateEntity,
    QAfterFilterCondition
  >
  albumStatsIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'albumStatsId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    AlbumStatsStateEntity,
    AlbumStatsStateEntity,
    QAfterFilterCondition
  >
  albumStatsIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'albumStatsId',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    AlbumStatsStateEntity,
    AlbumStatsStateEntity,
    QAfterFilterCondition
  >
  albumStatsIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'albumStatsId', value: ''),
      );
    });
  }

  QueryBuilder<
    AlbumStatsStateEntity,
    AlbumStatsStateEntity,
    QAfterFilterCondition
  >
  albumStatsIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'albumStatsId', value: ''),
      );
    });
  }

  QueryBuilder<
    AlbumStatsStateEntity,
    AlbumStatsStateEntity,
    QAfterFilterCondition
  >
  deletedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'deletedAt'),
      );
    });
  }

  QueryBuilder<
    AlbumStatsStateEntity,
    AlbumStatsStateEntity,
    QAfterFilterCondition
  >
  deletedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'deletedAt'),
      );
    });
  }

  QueryBuilder<
    AlbumStatsStateEntity,
    AlbumStatsStateEntity,
    QAfterFilterCondition
  >
  deletedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'deletedAt', value: value),
      );
    });
  }

  QueryBuilder<
    AlbumStatsStateEntity,
    AlbumStatsStateEntity,
    QAfterFilterCondition
  >
  deletedAtGreaterThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'deletedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    AlbumStatsStateEntity,
    AlbumStatsStateEntity,
    QAfterFilterCondition
  >
  deletedAtLessThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'deletedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    AlbumStatsStateEntity,
    AlbumStatsStateEntity,
    QAfterFilterCondition
  >
  deletedAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'deletedAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<
    AlbumStatsStateEntity,
    AlbumStatsStateEntity,
    QAfterFilterCondition
  >
  duplicateStickersEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'duplicateStickers', value: value),
      );
    });
  }

  QueryBuilder<
    AlbumStatsStateEntity,
    AlbumStatsStateEntity,
    QAfterFilterCondition
  >
  duplicateStickersGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'duplicateStickers',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    AlbumStatsStateEntity,
    AlbumStatsStateEntity,
    QAfterFilterCondition
  >
  duplicateStickersLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'duplicateStickers',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    AlbumStatsStateEntity,
    AlbumStatsStateEntity,
    QAfterFilterCondition
  >
  duplicateStickersBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'duplicateStickers',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<
    AlbumStatsStateEntity,
    AlbumStatsStateEntity,
    QAfterFilterCondition
  >
  isarIdEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'isarId', value: value),
      );
    });
  }

  QueryBuilder<
    AlbumStatsStateEntity,
    AlbumStatsStateEntity,
    QAfterFilterCondition
  >
  isarIdGreaterThan(Id value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'isarId',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    AlbumStatsStateEntity,
    AlbumStatsStateEntity,
    QAfterFilterCondition
  >
  isarIdLessThan(Id value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'isarId',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    AlbumStatsStateEntity,
    AlbumStatsStateEntity,
    QAfterFilterCondition
  >
  isarIdBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'isarId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<
    AlbumStatsStateEntity,
    AlbumStatsStateEntity,
    QAfterFilterCondition
  >
  missingFoilsEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'missingFoils', value: value),
      );
    });
  }

  QueryBuilder<
    AlbumStatsStateEntity,
    AlbumStatsStateEntity,
    QAfterFilterCondition
  >
  missingFoilsGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'missingFoils',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    AlbumStatsStateEntity,
    AlbumStatsStateEntity,
    QAfterFilterCondition
  >
  missingFoilsLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'missingFoils',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    AlbumStatsStateEntity,
    AlbumStatsStateEntity,
    QAfterFilterCondition
  >
  missingFoilsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'missingFoils',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<
    AlbumStatsStateEntity,
    AlbumStatsStateEntity,
    QAfterFilterCondition
  >
  missingStickersEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'missingStickers', value: value),
      );
    });
  }

  QueryBuilder<
    AlbumStatsStateEntity,
    AlbumStatsStateEntity,
    QAfterFilterCondition
  >
  missingStickersGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'missingStickers',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    AlbumStatsStateEntity,
    AlbumStatsStateEntity,
    QAfterFilterCondition
  >
  missingStickersLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'missingStickers',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    AlbumStatsStateEntity,
    AlbumStatsStateEntity,
    QAfterFilterCondition
  >
  missingStickersBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'missingStickers',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<
    AlbumStatsStateEntity,
    AlbumStatsStateEntity,
    QAfterFilterCondition
  >
  obtainedFoilsEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'obtainedFoils', value: value),
      );
    });
  }

  QueryBuilder<
    AlbumStatsStateEntity,
    AlbumStatsStateEntity,
    QAfterFilterCondition
  >
  obtainedFoilsGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'obtainedFoils',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    AlbumStatsStateEntity,
    AlbumStatsStateEntity,
    QAfterFilterCondition
  >
  obtainedFoilsLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'obtainedFoils',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    AlbumStatsStateEntity,
    AlbumStatsStateEntity,
    QAfterFilterCondition
  >
  obtainedFoilsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'obtainedFoils',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<
    AlbumStatsStateEntity,
    AlbumStatsStateEntity,
    QAfterFilterCondition
  >
  obtainedStickersEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'obtainedStickers', value: value),
      );
    });
  }

  QueryBuilder<
    AlbumStatsStateEntity,
    AlbumStatsStateEntity,
    QAfterFilterCondition
  >
  obtainedStickersGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'obtainedStickers',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    AlbumStatsStateEntity,
    AlbumStatsStateEntity,
    QAfterFilterCondition
  >
  obtainedStickersLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'obtainedStickers',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    AlbumStatsStateEntity,
    AlbumStatsStateEntity,
    QAfterFilterCondition
  >
  obtainedStickersBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'obtainedStickers',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<
    AlbumStatsStateEntity,
    AlbumStatsStateEntity,
    QAfterFilterCondition
  >
  progressEqualTo(double value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'progress',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<
    AlbumStatsStateEntity,
    AlbumStatsStateEntity,
    QAfterFilterCondition
  >
  progressGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'progress',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<
    AlbumStatsStateEntity,
    AlbumStatsStateEntity,
    QAfterFilterCondition
  >
  progressLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'progress',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<
    AlbumStatsStateEntity,
    AlbumStatsStateEntity,
    QAfterFilterCondition
  >
  progressBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'progress',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<
    AlbumStatsStateEntity,
    AlbumStatsStateEntity,
    QAfterFilterCondition
  >
  totalFoilsEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'totalFoils', value: value),
      );
    });
  }

  QueryBuilder<
    AlbumStatsStateEntity,
    AlbumStatsStateEntity,
    QAfterFilterCondition
  >
  totalFoilsGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'totalFoils',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    AlbumStatsStateEntity,
    AlbumStatsStateEntity,
    QAfterFilterCondition
  >
  totalFoilsLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'totalFoils',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    AlbumStatsStateEntity,
    AlbumStatsStateEntity,
    QAfterFilterCondition
  >
  totalFoilsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'totalFoils',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<
    AlbumStatsStateEntity,
    AlbumStatsStateEntity,
    QAfterFilterCondition
  >
  totalStickersEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'totalStickers', value: value),
      );
    });
  }

  QueryBuilder<
    AlbumStatsStateEntity,
    AlbumStatsStateEntity,
    QAfterFilterCondition
  >
  totalStickersGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'totalStickers',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    AlbumStatsStateEntity,
    AlbumStatsStateEntity,
    QAfterFilterCondition
  >
  totalStickersLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'totalStickers',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    AlbumStatsStateEntity,
    AlbumStatsStateEntity,
    QAfterFilterCondition
  >
  totalStickersBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'totalStickers',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<
    AlbumStatsStateEntity,
    AlbumStatsStateEntity,
    QAfterFilterCondition
  >
  updatedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'updatedAt', value: value),
      );
    });
  }

  QueryBuilder<
    AlbumStatsStateEntity,
    AlbumStatsStateEntity,
    QAfterFilterCondition
  >
  updatedAtGreaterThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'updatedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    AlbumStatsStateEntity,
    AlbumStatsStateEntity,
    QAfterFilterCondition
  >
  updatedAtLessThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'updatedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    AlbumStatsStateEntity,
    AlbumStatsStateEntity,
    QAfterFilterCondition
  >
  updatedAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'updatedAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<
    AlbumStatsStateEntity,
    AlbumStatsStateEntity,
    QAfterFilterCondition
  >
  userAlbumIdEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'userAlbumId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    AlbumStatsStateEntity,
    AlbumStatsStateEntity,
    QAfterFilterCondition
  >
  userAlbumIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'userAlbumId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    AlbumStatsStateEntity,
    AlbumStatsStateEntity,
    QAfterFilterCondition
  >
  userAlbumIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'userAlbumId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    AlbumStatsStateEntity,
    AlbumStatsStateEntity,
    QAfterFilterCondition
  >
  userAlbumIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'userAlbumId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    AlbumStatsStateEntity,
    AlbumStatsStateEntity,
    QAfterFilterCondition
  >
  userAlbumIdStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'userAlbumId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    AlbumStatsStateEntity,
    AlbumStatsStateEntity,
    QAfterFilterCondition
  >
  userAlbumIdEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'userAlbumId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    AlbumStatsStateEntity,
    AlbumStatsStateEntity,
    QAfterFilterCondition
  >
  userAlbumIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'userAlbumId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    AlbumStatsStateEntity,
    AlbumStatsStateEntity,
    QAfterFilterCondition
  >
  userAlbumIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'userAlbumId',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    AlbumStatsStateEntity,
    AlbumStatsStateEntity,
    QAfterFilterCondition
  >
  userAlbumIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'userAlbumId', value: ''),
      );
    });
  }

  QueryBuilder<
    AlbumStatsStateEntity,
    AlbumStatsStateEntity,
    QAfterFilterCondition
  >
  userAlbumIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'userAlbumId', value: ''),
      );
    });
  }
}

extension AlbumStatsStateEntityQueryObject
    on
        QueryBuilder<
          AlbumStatsStateEntity,
          AlbumStatsStateEntity,
          QFilterCondition
        > {}

extension AlbumStatsStateEntityQueryLinks
    on
        QueryBuilder<
          AlbumStatsStateEntity,
          AlbumStatsStateEntity,
          QFilterCondition
        > {}

extension AlbumStatsStateEntityQuerySortBy
    on QueryBuilder<AlbumStatsStateEntity, AlbumStatsStateEntity, QSortBy> {
  QueryBuilder<AlbumStatsStateEntity, AlbumStatsStateEntity, QAfterSortBy>
  sortByAlbumStatsId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'albumStatsId', Sort.asc);
    });
  }

  QueryBuilder<AlbumStatsStateEntity, AlbumStatsStateEntity, QAfterSortBy>
  sortByAlbumStatsIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'albumStatsId', Sort.desc);
    });
  }

  QueryBuilder<AlbumStatsStateEntity, AlbumStatsStateEntity, QAfterSortBy>
  sortByDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.asc);
    });
  }

  QueryBuilder<AlbumStatsStateEntity, AlbumStatsStateEntity, QAfterSortBy>
  sortByDeletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.desc);
    });
  }

  QueryBuilder<AlbumStatsStateEntity, AlbumStatsStateEntity, QAfterSortBy>
  sortByDuplicateStickers() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'duplicateStickers', Sort.asc);
    });
  }

  QueryBuilder<AlbumStatsStateEntity, AlbumStatsStateEntity, QAfterSortBy>
  sortByDuplicateStickersDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'duplicateStickers', Sort.desc);
    });
  }

  QueryBuilder<AlbumStatsStateEntity, AlbumStatsStateEntity, QAfterSortBy>
  sortByMissingFoils() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'missingFoils', Sort.asc);
    });
  }

  QueryBuilder<AlbumStatsStateEntity, AlbumStatsStateEntity, QAfterSortBy>
  sortByMissingFoilsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'missingFoils', Sort.desc);
    });
  }

  QueryBuilder<AlbumStatsStateEntity, AlbumStatsStateEntity, QAfterSortBy>
  sortByMissingStickers() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'missingStickers', Sort.asc);
    });
  }

  QueryBuilder<AlbumStatsStateEntity, AlbumStatsStateEntity, QAfterSortBy>
  sortByMissingStickersDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'missingStickers', Sort.desc);
    });
  }

  QueryBuilder<AlbumStatsStateEntity, AlbumStatsStateEntity, QAfterSortBy>
  sortByObtainedFoils() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'obtainedFoils', Sort.asc);
    });
  }

  QueryBuilder<AlbumStatsStateEntity, AlbumStatsStateEntity, QAfterSortBy>
  sortByObtainedFoilsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'obtainedFoils', Sort.desc);
    });
  }

  QueryBuilder<AlbumStatsStateEntity, AlbumStatsStateEntity, QAfterSortBy>
  sortByObtainedStickers() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'obtainedStickers', Sort.asc);
    });
  }

  QueryBuilder<AlbumStatsStateEntity, AlbumStatsStateEntity, QAfterSortBy>
  sortByObtainedStickersDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'obtainedStickers', Sort.desc);
    });
  }

  QueryBuilder<AlbumStatsStateEntity, AlbumStatsStateEntity, QAfterSortBy>
  sortByProgress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'progress', Sort.asc);
    });
  }

  QueryBuilder<AlbumStatsStateEntity, AlbumStatsStateEntity, QAfterSortBy>
  sortByProgressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'progress', Sort.desc);
    });
  }

  QueryBuilder<AlbumStatsStateEntity, AlbumStatsStateEntity, QAfterSortBy>
  sortByTotalFoils() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalFoils', Sort.asc);
    });
  }

  QueryBuilder<AlbumStatsStateEntity, AlbumStatsStateEntity, QAfterSortBy>
  sortByTotalFoilsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalFoils', Sort.desc);
    });
  }

  QueryBuilder<AlbumStatsStateEntity, AlbumStatsStateEntity, QAfterSortBy>
  sortByTotalStickers() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalStickers', Sort.asc);
    });
  }

  QueryBuilder<AlbumStatsStateEntity, AlbumStatsStateEntity, QAfterSortBy>
  sortByTotalStickersDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalStickers', Sort.desc);
    });
  }

  QueryBuilder<AlbumStatsStateEntity, AlbumStatsStateEntity, QAfterSortBy>
  sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<AlbumStatsStateEntity, AlbumStatsStateEntity, QAfterSortBy>
  sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<AlbumStatsStateEntity, AlbumStatsStateEntity, QAfterSortBy>
  sortByUserAlbumId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userAlbumId', Sort.asc);
    });
  }

  QueryBuilder<AlbumStatsStateEntity, AlbumStatsStateEntity, QAfterSortBy>
  sortByUserAlbumIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userAlbumId', Sort.desc);
    });
  }
}

extension AlbumStatsStateEntityQuerySortThenBy
    on QueryBuilder<AlbumStatsStateEntity, AlbumStatsStateEntity, QSortThenBy> {
  QueryBuilder<AlbumStatsStateEntity, AlbumStatsStateEntity, QAfterSortBy>
  thenByAlbumStatsId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'albumStatsId', Sort.asc);
    });
  }

  QueryBuilder<AlbumStatsStateEntity, AlbumStatsStateEntity, QAfterSortBy>
  thenByAlbumStatsIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'albumStatsId', Sort.desc);
    });
  }

  QueryBuilder<AlbumStatsStateEntity, AlbumStatsStateEntity, QAfterSortBy>
  thenByDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.asc);
    });
  }

  QueryBuilder<AlbumStatsStateEntity, AlbumStatsStateEntity, QAfterSortBy>
  thenByDeletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.desc);
    });
  }

  QueryBuilder<AlbumStatsStateEntity, AlbumStatsStateEntity, QAfterSortBy>
  thenByDuplicateStickers() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'duplicateStickers', Sort.asc);
    });
  }

  QueryBuilder<AlbumStatsStateEntity, AlbumStatsStateEntity, QAfterSortBy>
  thenByDuplicateStickersDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'duplicateStickers', Sort.desc);
    });
  }

  QueryBuilder<AlbumStatsStateEntity, AlbumStatsStateEntity, QAfterSortBy>
  thenByIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.asc);
    });
  }

  QueryBuilder<AlbumStatsStateEntity, AlbumStatsStateEntity, QAfterSortBy>
  thenByIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.desc);
    });
  }

  QueryBuilder<AlbumStatsStateEntity, AlbumStatsStateEntity, QAfterSortBy>
  thenByMissingFoils() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'missingFoils', Sort.asc);
    });
  }

  QueryBuilder<AlbumStatsStateEntity, AlbumStatsStateEntity, QAfterSortBy>
  thenByMissingFoilsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'missingFoils', Sort.desc);
    });
  }

  QueryBuilder<AlbumStatsStateEntity, AlbumStatsStateEntity, QAfterSortBy>
  thenByMissingStickers() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'missingStickers', Sort.asc);
    });
  }

  QueryBuilder<AlbumStatsStateEntity, AlbumStatsStateEntity, QAfterSortBy>
  thenByMissingStickersDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'missingStickers', Sort.desc);
    });
  }

  QueryBuilder<AlbumStatsStateEntity, AlbumStatsStateEntity, QAfterSortBy>
  thenByObtainedFoils() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'obtainedFoils', Sort.asc);
    });
  }

  QueryBuilder<AlbumStatsStateEntity, AlbumStatsStateEntity, QAfterSortBy>
  thenByObtainedFoilsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'obtainedFoils', Sort.desc);
    });
  }

  QueryBuilder<AlbumStatsStateEntity, AlbumStatsStateEntity, QAfterSortBy>
  thenByObtainedStickers() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'obtainedStickers', Sort.asc);
    });
  }

  QueryBuilder<AlbumStatsStateEntity, AlbumStatsStateEntity, QAfterSortBy>
  thenByObtainedStickersDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'obtainedStickers', Sort.desc);
    });
  }

  QueryBuilder<AlbumStatsStateEntity, AlbumStatsStateEntity, QAfterSortBy>
  thenByProgress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'progress', Sort.asc);
    });
  }

  QueryBuilder<AlbumStatsStateEntity, AlbumStatsStateEntity, QAfterSortBy>
  thenByProgressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'progress', Sort.desc);
    });
  }

  QueryBuilder<AlbumStatsStateEntity, AlbumStatsStateEntity, QAfterSortBy>
  thenByTotalFoils() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalFoils', Sort.asc);
    });
  }

  QueryBuilder<AlbumStatsStateEntity, AlbumStatsStateEntity, QAfterSortBy>
  thenByTotalFoilsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalFoils', Sort.desc);
    });
  }

  QueryBuilder<AlbumStatsStateEntity, AlbumStatsStateEntity, QAfterSortBy>
  thenByTotalStickers() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalStickers', Sort.asc);
    });
  }

  QueryBuilder<AlbumStatsStateEntity, AlbumStatsStateEntity, QAfterSortBy>
  thenByTotalStickersDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalStickers', Sort.desc);
    });
  }

  QueryBuilder<AlbumStatsStateEntity, AlbumStatsStateEntity, QAfterSortBy>
  thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<AlbumStatsStateEntity, AlbumStatsStateEntity, QAfterSortBy>
  thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<AlbumStatsStateEntity, AlbumStatsStateEntity, QAfterSortBy>
  thenByUserAlbumId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userAlbumId', Sort.asc);
    });
  }

  QueryBuilder<AlbumStatsStateEntity, AlbumStatsStateEntity, QAfterSortBy>
  thenByUserAlbumIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userAlbumId', Sort.desc);
    });
  }
}

extension AlbumStatsStateEntityQueryWhereDistinct
    on QueryBuilder<AlbumStatsStateEntity, AlbumStatsStateEntity, QDistinct> {
  QueryBuilder<AlbumStatsStateEntity, AlbumStatsStateEntity, QDistinct>
  distinctByAlbumStatsId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'albumStatsId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AlbumStatsStateEntity, AlbumStatsStateEntity, QDistinct>
  distinctByDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'deletedAt');
    });
  }

  QueryBuilder<AlbumStatsStateEntity, AlbumStatsStateEntity, QDistinct>
  distinctByDuplicateStickers() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'duplicateStickers');
    });
  }

  QueryBuilder<AlbumStatsStateEntity, AlbumStatsStateEntity, QDistinct>
  distinctByMissingFoils() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'missingFoils');
    });
  }

  QueryBuilder<AlbumStatsStateEntity, AlbumStatsStateEntity, QDistinct>
  distinctByMissingStickers() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'missingStickers');
    });
  }

  QueryBuilder<AlbumStatsStateEntity, AlbumStatsStateEntity, QDistinct>
  distinctByObtainedFoils() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'obtainedFoils');
    });
  }

  QueryBuilder<AlbumStatsStateEntity, AlbumStatsStateEntity, QDistinct>
  distinctByObtainedStickers() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'obtainedStickers');
    });
  }

  QueryBuilder<AlbumStatsStateEntity, AlbumStatsStateEntity, QDistinct>
  distinctByProgress() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'progress');
    });
  }

  QueryBuilder<AlbumStatsStateEntity, AlbumStatsStateEntity, QDistinct>
  distinctByTotalFoils() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalFoils');
    });
  }

  QueryBuilder<AlbumStatsStateEntity, AlbumStatsStateEntity, QDistinct>
  distinctByTotalStickers() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalStickers');
    });
  }

  QueryBuilder<AlbumStatsStateEntity, AlbumStatsStateEntity, QDistinct>
  distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }

  QueryBuilder<AlbumStatsStateEntity, AlbumStatsStateEntity, QDistinct>
  distinctByUserAlbumId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userAlbumId', caseSensitive: caseSensitive);
    });
  }
}

extension AlbumStatsStateEntityQueryProperty
    on
        QueryBuilder<
          AlbumStatsStateEntity,
          AlbumStatsStateEntity,
          QQueryProperty
        > {
  QueryBuilder<AlbumStatsStateEntity, int, QQueryOperations> isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarId');
    });
  }

  QueryBuilder<AlbumStatsStateEntity, String, QQueryOperations>
  albumStatsIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'albumStatsId');
    });
  }

  QueryBuilder<AlbumStatsStateEntity, DateTime?, QQueryOperations>
  deletedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'deletedAt');
    });
  }

  QueryBuilder<AlbumStatsStateEntity, int, QQueryOperations>
  duplicateStickersProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'duplicateStickers');
    });
  }

  QueryBuilder<AlbumStatsStateEntity, int, QQueryOperations>
  missingFoilsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'missingFoils');
    });
  }

  QueryBuilder<AlbumStatsStateEntity, int, QQueryOperations>
  missingStickersProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'missingStickers');
    });
  }

  QueryBuilder<AlbumStatsStateEntity, int, QQueryOperations>
  obtainedFoilsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'obtainedFoils');
    });
  }

  QueryBuilder<AlbumStatsStateEntity, int, QQueryOperations>
  obtainedStickersProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'obtainedStickers');
    });
  }

  QueryBuilder<AlbumStatsStateEntity, double, QQueryOperations>
  progressProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'progress');
    });
  }

  QueryBuilder<AlbumStatsStateEntity, int, QQueryOperations>
  totalFoilsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalFoils');
    });
  }

  QueryBuilder<AlbumStatsStateEntity, int, QQueryOperations>
  totalStickersProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalStickers');
    });
  }

  QueryBuilder<AlbumStatsStateEntity, DateTime, QQueryOperations>
  updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }

  QueryBuilder<AlbumStatsStateEntity, String, QQueryOperations>
  userAlbumIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userAlbumId');
    });
  }
}
