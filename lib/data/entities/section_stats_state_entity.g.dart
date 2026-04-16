// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'section_stats_state_entity.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetSectionStatsStateEntityCollection on Isar {
  IsarCollection<SectionStatsStateEntity> get sectionStatsStateEntitys =>
      this.collection();
}

const CollectionSchema<SectionStatsStateEntity> SectionStatsStateEntitySchema =
    CollectionSchema(
      name: r'SectionStatsStateEntity',
      id: 5082960561785476839,
      properties: {
        r'deletedAt': PropertySchema(
          id: 0,
          name: r'deletedAt',
          type: IsarType.dateTime,
        ),
        r'duplicateStickers': PropertySchema(
          id: 1,
          name: r'duplicateStickers',
          type: IsarType.long,
        ),
        r'missingStickers': PropertySchema(
          id: 2,
          name: r'missingStickers',
          type: IsarType.long,
        ),
        r'obtainedStickers': PropertySchema(
          id: 3,
          name: r'obtainedStickers',
          type: IsarType.long,
        ),
        r'progress': PropertySchema(
          id: 4,
          name: r'progress',
          type: IsarType.double,
        ),
        r'sectionId': PropertySchema(
          id: 5,
          name: r'sectionId',
          type: IsarType.string,
        ),
        r'sectionStatsId': PropertySchema(
          id: 6,
          name: r'sectionStatsId',
          type: IsarType.string,
        ),
        r'totalStickers': PropertySchema(
          id: 7,
          name: r'totalStickers',
          type: IsarType.long,
        ),
        r'updatedAt': PropertySchema(
          id: 8,
          name: r'updatedAt',
          type: IsarType.dateTime,
        ),
        r'userAlbumId': PropertySchema(
          id: 9,
          name: r'userAlbumId',
          type: IsarType.string,
        ),
      },

      estimateSize: _sectionStatsStateEntityEstimateSize,
      serialize: _sectionStatsStateEntitySerialize,
      deserialize: _sectionStatsStateEntityDeserialize,
      deserializeProp: _sectionStatsStateEntityDeserializeProp,
      idName: r'isarId',
      indexes: {
        r'sectionStatsId': IndexSchema(
          id: 54518000586826680,
          name: r'sectionStatsId',
          unique: true,
          replace: true,
          properties: [
            IndexPropertySchema(
              name: r'sectionStatsId',
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
        r'sectionId': IndexSchema(
          id: 2871565378294445407,
          name: r'sectionId',
          unique: false,
          replace: false,
          properties: [
            IndexPropertySchema(
              name: r'sectionId',
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

      getId: _sectionStatsStateEntityGetId,
      getLinks: _sectionStatsStateEntityGetLinks,
      attach: _sectionStatsStateEntityAttach,
      version: '3.3.0',
    );

int _sectionStatsStateEntityEstimateSize(
  SectionStatsStateEntity object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.sectionId.length * 3;
  bytesCount += 3 + object.sectionStatsId.length * 3;
  bytesCount += 3 + object.userAlbumId.length * 3;
  return bytesCount;
}

void _sectionStatsStateEntitySerialize(
  SectionStatsStateEntity object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.deletedAt);
  writer.writeLong(offsets[1], object.duplicateStickers);
  writer.writeLong(offsets[2], object.missingStickers);
  writer.writeLong(offsets[3], object.obtainedStickers);
  writer.writeDouble(offsets[4], object.progress);
  writer.writeString(offsets[5], object.sectionId);
  writer.writeString(offsets[6], object.sectionStatsId);
  writer.writeLong(offsets[7], object.totalStickers);
  writer.writeDateTime(offsets[8], object.updatedAt);
  writer.writeString(offsets[9], object.userAlbumId);
}

SectionStatsStateEntity _sectionStatsStateEntityDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = SectionStatsStateEntity();
  object.deletedAt = reader.readDateTimeOrNull(offsets[0]);
  object.duplicateStickers = reader.readLong(offsets[1]);
  object.isarId = id;
  object.missingStickers = reader.readLong(offsets[2]);
  object.obtainedStickers = reader.readLong(offsets[3]);
  object.progress = reader.readDouble(offsets[4]);
  object.sectionId = reader.readString(offsets[5]);
  object.sectionStatsId = reader.readString(offsets[6]);
  object.totalStickers = reader.readLong(offsets[7]);
  object.updatedAt = reader.readDateTime(offsets[8]);
  object.userAlbumId = reader.readString(offsets[9]);
  return object;
}

P _sectionStatsStateEntityDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (reader.readDouble(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readLong(offset)) as P;
    case 8:
      return (reader.readDateTime(offset)) as P;
    case 9:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _sectionStatsStateEntityGetId(SectionStatsStateEntity object) {
  return object.isarId;
}

List<IsarLinkBase<dynamic>> _sectionStatsStateEntityGetLinks(
  SectionStatsStateEntity object,
) {
  return [];
}

void _sectionStatsStateEntityAttach(
  IsarCollection<dynamic> col,
  Id id,
  SectionStatsStateEntity object,
) {
  object.isarId = id;
}

extension SectionStatsStateEntityByIndex
    on IsarCollection<SectionStatsStateEntity> {
  Future<SectionStatsStateEntity?> getBySectionStatsId(String sectionStatsId) {
    return getByIndex(r'sectionStatsId', [sectionStatsId]);
  }

  SectionStatsStateEntity? getBySectionStatsIdSync(String sectionStatsId) {
    return getByIndexSync(r'sectionStatsId', [sectionStatsId]);
  }

  Future<bool> deleteBySectionStatsId(String sectionStatsId) {
    return deleteByIndex(r'sectionStatsId', [sectionStatsId]);
  }

  bool deleteBySectionStatsIdSync(String sectionStatsId) {
    return deleteByIndexSync(r'sectionStatsId', [sectionStatsId]);
  }

  Future<List<SectionStatsStateEntity?>> getAllBySectionStatsId(
    List<String> sectionStatsIdValues,
  ) {
    final values = sectionStatsIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'sectionStatsId', values);
  }

  List<SectionStatsStateEntity?> getAllBySectionStatsIdSync(
    List<String> sectionStatsIdValues,
  ) {
    final values = sectionStatsIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'sectionStatsId', values);
  }

  Future<int> deleteAllBySectionStatsId(List<String> sectionStatsIdValues) {
    final values = sectionStatsIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'sectionStatsId', values);
  }

  int deleteAllBySectionStatsIdSync(List<String> sectionStatsIdValues) {
    final values = sectionStatsIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'sectionStatsId', values);
  }

  Future<Id> putBySectionStatsId(SectionStatsStateEntity object) {
    return putByIndex(r'sectionStatsId', object);
  }

  Id putBySectionStatsIdSync(
    SectionStatsStateEntity object, {
    bool saveLinks = true,
  }) {
    return putByIndexSync(r'sectionStatsId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllBySectionStatsId(
    List<SectionStatsStateEntity> objects,
  ) {
    return putAllByIndex(r'sectionStatsId', objects);
  }

  List<Id> putAllBySectionStatsIdSync(
    List<SectionStatsStateEntity> objects, {
    bool saveLinks = true,
  }) {
    return putAllByIndexSync(r'sectionStatsId', objects, saveLinks: saveLinks);
  }
}

extension SectionStatsStateEntityQueryWhereSort
    on QueryBuilder<SectionStatsStateEntity, SectionStatsStateEntity, QWhere> {
  QueryBuilder<SectionStatsStateEntity, SectionStatsStateEntity, QAfterWhere>
  anyIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<SectionStatsStateEntity, SectionStatsStateEntity, QAfterWhere>
  anyUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'updatedAt'),
      );
    });
  }
}

extension SectionStatsStateEntityQueryWhere
    on
        QueryBuilder<
          SectionStatsStateEntity,
          SectionStatsStateEntity,
          QWhereClause
        > {
  QueryBuilder<
    SectionStatsStateEntity,
    SectionStatsStateEntity,
    QAfterWhereClause
  >
  isarIdEqualTo(Id isarId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.between(lower: isarId, upper: isarId),
      );
    });
  }

  QueryBuilder<
    SectionStatsStateEntity,
    SectionStatsStateEntity,
    QAfterWhereClause
  >
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

  QueryBuilder<
    SectionStatsStateEntity,
    SectionStatsStateEntity,
    QAfterWhereClause
  >
  isarIdGreaterThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarId, includeLower: include),
      );
    });
  }

  QueryBuilder<
    SectionStatsStateEntity,
    SectionStatsStateEntity,
    QAfterWhereClause
  >
  isarIdLessThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarId, includeUpper: include),
      );
    });
  }

  QueryBuilder<
    SectionStatsStateEntity,
    SectionStatsStateEntity,
    QAfterWhereClause
  >
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

  QueryBuilder<
    SectionStatsStateEntity,
    SectionStatsStateEntity,
    QAfterWhereClause
  >
  sectionStatsIdEqualTo(String sectionStatsId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(
          indexName: r'sectionStatsId',
          value: [sectionStatsId],
        ),
      );
    });
  }

  QueryBuilder<
    SectionStatsStateEntity,
    SectionStatsStateEntity,
    QAfterWhereClause
  >
  sectionStatsIdNotEqualTo(String sectionStatsId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'sectionStatsId',
                lower: [],
                upper: [sectionStatsId],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'sectionStatsId',
                lower: [sectionStatsId],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'sectionStatsId',
                lower: [sectionStatsId],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'sectionStatsId',
                lower: [],
                upper: [sectionStatsId],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<
    SectionStatsStateEntity,
    SectionStatsStateEntity,
    QAfterWhereClause
  >
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

  QueryBuilder<
    SectionStatsStateEntity,
    SectionStatsStateEntity,
    QAfterWhereClause
  >
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

  QueryBuilder<
    SectionStatsStateEntity,
    SectionStatsStateEntity,
    QAfterWhereClause
  >
  sectionIdEqualTo(String sectionId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'sectionId', value: [sectionId]),
      );
    });
  }

  QueryBuilder<
    SectionStatsStateEntity,
    SectionStatsStateEntity,
    QAfterWhereClause
  >
  sectionIdNotEqualTo(String sectionId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'sectionId',
                lower: [],
                upper: [sectionId],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'sectionId',
                lower: [sectionId],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'sectionId',
                lower: [sectionId],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'sectionId',
                lower: [],
                upper: [sectionId],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<
    SectionStatsStateEntity,
    SectionStatsStateEntity,
    QAfterWhereClause
  >
  updatedAtEqualTo(DateTime updatedAt) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'updatedAt', value: [updatedAt]),
      );
    });
  }

  QueryBuilder<
    SectionStatsStateEntity,
    SectionStatsStateEntity,
    QAfterWhereClause
  >
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

  QueryBuilder<
    SectionStatsStateEntity,
    SectionStatsStateEntity,
    QAfterWhereClause
  >
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

  QueryBuilder<
    SectionStatsStateEntity,
    SectionStatsStateEntity,
    QAfterWhereClause
  >
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

  QueryBuilder<
    SectionStatsStateEntity,
    SectionStatsStateEntity,
    QAfterWhereClause
  >
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

extension SectionStatsStateEntityQueryFilter
    on
        QueryBuilder<
          SectionStatsStateEntity,
          SectionStatsStateEntity,
          QFilterCondition
        > {
  QueryBuilder<
    SectionStatsStateEntity,
    SectionStatsStateEntity,
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
    SectionStatsStateEntity,
    SectionStatsStateEntity,
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
    SectionStatsStateEntity,
    SectionStatsStateEntity,
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
    SectionStatsStateEntity,
    SectionStatsStateEntity,
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
    SectionStatsStateEntity,
    SectionStatsStateEntity,
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
    SectionStatsStateEntity,
    SectionStatsStateEntity,
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
    SectionStatsStateEntity,
    SectionStatsStateEntity,
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
    SectionStatsStateEntity,
    SectionStatsStateEntity,
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
    SectionStatsStateEntity,
    SectionStatsStateEntity,
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
    SectionStatsStateEntity,
    SectionStatsStateEntity,
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
    SectionStatsStateEntity,
    SectionStatsStateEntity,
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
    SectionStatsStateEntity,
    SectionStatsStateEntity,
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
    SectionStatsStateEntity,
    SectionStatsStateEntity,
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
    SectionStatsStateEntity,
    SectionStatsStateEntity,
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
    SectionStatsStateEntity,
    SectionStatsStateEntity,
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
    SectionStatsStateEntity,
    SectionStatsStateEntity,
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
    SectionStatsStateEntity,
    SectionStatsStateEntity,
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
    SectionStatsStateEntity,
    SectionStatsStateEntity,
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
    SectionStatsStateEntity,
    SectionStatsStateEntity,
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
    SectionStatsStateEntity,
    SectionStatsStateEntity,
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
    SectionStatsStateEntity,
    SectionStatsStateEntity,
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
    SectionStatsStateEntity,
    SectionStatsStateEntity,
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
    SectionStatsStateEntity,
    SectionStatsStateEntity,
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
    SectionStatsStateEntity,
    SectionStatsStateEntity,
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
    SectionStatsStateEntity,
    SectionStatsStateEntity,
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
    SectionStatsStateEntity,
    SectionStatsStateEntity,
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
    SectionStatsStateEntity,
    SectionStatsStateEntity,
    QAfterFilterCondition
  >
  sectionIdEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'sectionId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    SectionStatsStateEntity,
    SectionStatsStateEntity,
    QAfterFilterCondition
  >
  sectionIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'sectionId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    SectionStatsStateEntity,
    SectionStatsStateEntity,
    QAfterFilterCondition
  >
  sectionIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'sectionId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    SectionStatsStateEntity,
    SectionStatsStateEntity,
    QAfterFilterCondition
  >
  sectionIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'sectionId',
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
    SectionStatsStateEntity,
    SectionStatsStateEntity,
    QAfterFilterCondition
  >
  sectionIdStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'sectionId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    SectionStatsStateEntity,
    SectionStatsStateEntity,
    QAfterFilterCondition
  >
  sectionIdEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'sectionId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    SectionStatsStateEntity,
    SectionStatsStateEntity,
    QAfterFilterCondition
  >
  sectionIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'sectionId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    SectionStatsStateEntity,
    SectionStatsStateEntity,
    QAfterFilterCondition
  >
  sectionIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'sectionId',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    SectionStatsStateEntity,
    SectionStatsStateEntity,
    QAfterFilterCondition
  >
  sectionIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'sectionId', value: ''),
      );
    });
  }

  QueryBuilder<
    SectionStatsStateEntity,
    SectionStatsStateEntity,
    QAfterFilterCondition
  >
  sectionIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'sectionId', value: ''),
      );
    });
  }

  QueryBuilder<
    SectionStatsStateEntity,
    SectionStatsStateEntity,
    QAfterFilterCondition
  >
  sectionStatsIdEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'sectionStatsId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    SectionStatsStateEntity,
    SectionStatsStateEntity,
    QAfterFilterCondition
  >
  sectionStatsIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'sectionStatsId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    SectionStatsStateEntity,
    SectionStatsStateEntity,
    QAfterFilterCondition
  >
  sectionStatsIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'sectionStatsId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    SectionStatsStateEntity,
    SectionStatsStateEntity,
    QAfterFilterCondition
  >
  sectionStatsIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'sectionStatsId',
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
    SectionStatsStateEntity,
    SectionStatsStateEntity,
    QAfterFilterCondition
  >
  sectionStatsIdStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'sectionStatsId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    SectionStatsStateEntity,
    SectionStatsStateEntity,
    QAfterFilterCondition
  >
  sectionStatsIdEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'sectionStatsId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    SectionStatsStateEntity,
    SectionStatsStateEntity,
    QAfterFilterCondition
  >
  sectionStatsIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'sectionStatsId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    SectionStatsStateEntity,
    SectionStatsStateEntity,
    QAfterFilterCondition
  >
  sectionStatsIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'sectionStatsId',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    SectionStatsStateEntity,
    SectionStatsStateEntity,
    QAfterFilterCondition
  >
  sectionStatsIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'sectionStatsId', value: ''),
      );
    });
  }

  QueryBuilder<
    SectionStatsStateEntity,
    SectionStatsStateEntity,
    QAfterFilterCondition
  >
  sectionStatsIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'sectionStatsId', value: ''),
      );
    });
  }

  QueryBuilder<
    SectionStatsStateEntity,
    SectionStatsStateEntity,
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
    SectionStatsStateEntity,
    SectionStatsStateEntity,
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
    SectionStatsStateEntity,
    SectionStatsStateEntity,
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
    SectionStatsStateEntity,
    SectionStatsStateEntity,
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
    SectionStatsStateEntity,
    SectionStatsStateEntity,
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
    SectionStatsStateEntity,
    SectionStatsStateEntity,
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
    SectionStatsStateEntity,
    SectionStatsStateEntity,
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
    SectionStatsStateEntity,
    SectionStatsStateEntity,
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
    SectionStatsStateEntity,
    SectionStatsStateEntity,
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
    SectionStatsStateEntity,
    SectionStatsStateEntity,
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
    SectionStatsStateEntity,
    SectionStatsStateEntity,
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
    SectionStatsStateEntity,
    SectionStatsStateEntity,
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
    SectionStatsStateEntity,
    SectionStatsStateEntity,
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
    SectionStatsStateEntity,
    SectionStatsStateEntity,
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
    SectionStatsStateEntity,
    SectionStatsStateEntity,
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
    SectionStatsStateEntity,
    SectionStatsStateEntity,
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
    SectionStatsStateEntity,
    SectionStatsStateEntity,
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
    SectionStatsStateEntity,
    SectionStatsStateEntity,
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

extension SectionStatsStateEntityQueryObject
    on
        QueryBuilder<
          SectionStatsStateEntity,
          SectionStatsStateEntity,
          QFilterCondition
        > {}

extension SectionStatsStateEntityQueryLinks
    on
        QueryBuilder<
          SectionStatsStateEntity,
          SectionStatsStateEntity,
          QFilterCondition
        > {}

extension SectionStatsStateEntityQuerySortBy
    on QueryBuilder<SectionStatsStateEntity, SectionStatsStateEntity, QSortBy> {
  QueryBuilder<SectionStatsStateEntity, SectionStatsStateEntity, QAfterSortBy>
  sortByDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.asc);
    });
  }

  QueryBuilder<SectionStatsStateEntity, SectionStatsStateEntity, QAfterSortBy>
  sortByDeletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.desc);
    });
  }

  QueryBuilder<SectionStatsStateEntity, SectionStatsStateEntity, QAfterSortBy>
  sortByDuplicateStickers() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'duplicateStickers', Sort.asc);
    });
  }

  QueryBuilder<SectionStatsStateEntity, SectionStatsStateEntity, QAfterSortBy>
  sortByDuplicateStickersDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'duplicateStickers', Sort.desc);
    });
  }

  QueryBuilder<SectionStatsStateEntity, SectionStatsStateEntity, QAfterSortBy>
  sortByMissingStickers() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'missingStickers', Sort.asc);
    });
  }

  QueryBuilder<SectionStatsStateEntity, SectionStatsStateEntity, QAfterSortBy>
  sortByMissingStickersDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'missingStickers', Sort.desc);
    });
  }

  QueryBuilder<SectionStatsStateEntity, SectionStatsStateEntity, QAfterSortBy>
  sortByObtainedStickers() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'obtainedStickers', Sort.asc);
    });
  }

  QueryBuilder<SectionStatsStateEntity, SectionStatsStateEntity, QAfterSortBy>
  sortByObtainedStickersDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'obtainedStickers', Sort.desc);
    });
  }

  QueryBuilder<SectionStatsStateEntity, SectionStatsStateEntity, QAfterSortBy>
  sortByProgress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'progress', Sort.asc);
    });
  }

  QueryBuilder<SectionStatsStateEntity, SectionStatsStateEntity, QAfterSortBy>
  sortByProgressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'progress', Sort.desc);
    });
  }

  QueryBuilder<SectionStatsStateEntity, SectionStatsStateEntity, QAfterSortBy>
  sortBySectionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sectionId', Sort.asc);
    });
  }

  QueryBuilder<SectionStatsStateEntity, SectionStatsStateEntity, QAfterSortBy>
  sortBySectionIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sectionId', Sort.desc);
    });
  }

  QueryBuilder<SectionStatsStateEntity, SectionStatsStateEntity, QAfterSortBy>
  sortBySectionStatsId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sectionStatsId', Sort.asc);
    });
  }

  QueryBuilder<SectionStatsStateEntity, SectionStatsStateEntity, QAfterSortBy>
  sortBySectionStatsIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sectionStatsId', Sort.desc);
    });
  }

  QueryBuilder<SectionStatsStateEntity, SectionStatsStateEntity, QAfterSortBy>
  sortByTotalStickers() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalStickers', Sort.asc);
    });
  }

  QueryBuilder<SectionStatsStateEntity, SectionStatsStateEntity, QAfterSortBy>
  sortByTotalStickersDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalStickers', Sort.desc);
    });
  }

  QueryBuilder<SectionStatsStateEntity, SectionStatsStateEntity, QAfterSortBy>
  sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<SectionStatsStateEntity, SectionStatsStateEntity, QAfterSortBy>
  sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<SectionStatsStateEntity, SectionStatsStateEntity, QAfterSortBy>
  sortByUserAlbumId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userAlbumId', Sort.asc);
    });
  }

  QueryBuilder<SectionStatsStateEntity, SectionStatsStateEntity, QAfterSortBy>
  sortByUserAlbumIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userAlbumId', Sort.desc);
    });
  }
}

extension SectionStatsStateEntityQuerySortThenBy
    on
        QueryBuilder<
          SectionStatsStateEntity,
          SectionStatsStateEntity,
          QSortThenBy
        > {
  QueryBuilder<SectionStatsStateEntity, SectionStatsStateEntity, QAfterSortBy>
  thenByDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.asc);
    });
  }

  QueryBuilder<SectionStatsStateEntity, SectionStatsStateEntity, QAfterSortBy>
  thenByDeletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.desc);
    });
  }

  QueryBuilder<SectionStatsStateEntity, SectionStatsStateEntity, QAfterSortBy>
  thenByDuplicateStickers() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'duplicateStickers', Sort.asc);
    });
  }

  QueryBuilder<SectionStatsStateEntity, SectionStatsStateEntity, QAfterSortBy>
  thenByDuplicateStickersDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'duplicateStickers', Sort.desc);
    });
  }

  QueryBuilder<SectionStatsStateEntity, SectionStatsStateEntity, QAfterSortBy>
  thenByIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.asc);
    });
  }

  QueryBuilder<SectionStatsStateEntity, SectionStatsStateEntity, QAfterSortBy>
  thenByIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.desc);
    });
  }

  QueryBuilder<SectionStatsStateEntity, SectionStatsStateEntity, QAfterSortBy>
  thenByMissingStickers() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'missingStickers', Sort.asc);
    });
  }

  QueryBuilder<SectionStatsStateEntity, SectionStatsStateEntity, QAfterSortBy>
  thenByMissingStickersDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'missingStickers', Sort.desc);
    });
  }

  QueryBuilder<SectionStatsStateEntity, SectionStatsStateEntity, QAfterSortBy>
  thenByObtainedStickers() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'obtainedStickers', Sort.asc);
    });
  }

  QueryBuilder<SectionStatsStateEntity, SectionStatsStateEntity, QAfterSortBy>
  thenByObtainedStickersDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'obtainedStickers', Sort.desc);
    });
  }

  QueryBuilder<SectionStatsStateEntity, SectionStatsStateEntity, QAfterSortBy>
  thenByProgress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'progress', Sort.asc);
    });
  }

  QueryBuilder<SectionStatsStateEntity, SectionStatsStateEntity, QAfterSortBy>
  thenByProgressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'progress', Sort.desc);
    });
  }

  QueryBuilder<SectionStatsStateEntity, SectionStatsStateEntity, QAfterSortBy>
  thenBySectionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sectionId', Sort.asc);
    });
  }

  QueryBuilder<SectionStatsStateEntity, SectionStatsStateEntity, QAfterSortBy>
  thenBySectionIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sectionId', Sort.desc);
    });
  }

  QueryBuilder<SectionStatsStateEntity, SectionStatsStateEntity, QAfterSortBy>
  thenBySectionStatsId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sectionStatsId', Sort.asc);
    });
  }

  QueryBuilder<SectionStatsStateEntity, SectionStatsStateEntity, QAfterSortBy>
  thenBySectionStatsIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sectionStatsId', Sort.desc);
    });
  }

  QueryBuilder<SectionStatsStateEntity, SectionStatsStateEntity, QAfterSortBy>
  thenByTotalStickers() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalStickers', Sort.asc);
    });
  }

  QueryBuilder<SectionStatsStateEntity, SectionStatsStateEntity, QAfterSortBy>
  thenByTotalStickersDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalStickers', Sort.desc);
    });
  }

  QueryBuilder<SectionStatsStateEntity, SectionStatsStateEntity, QAfterSortBy>
  thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<SectionStatsStateEntity, SectionStatsStateEntity, QAfterSortBy>
  thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<SectionStatsStateEntity, SectionStatsStateEntity, QAfterSortBy>
  thenByUserAlbumId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userAlbumId', Sort.asc);
    });
  }

  QueryBuilder<SectionStatsStateEntity, SectionStatsStateEntity, QAfterSortBy>
  thenByUserAlbumIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userAlbumId', Sort.desc);
    });
  }
}

extension SectionStatsStateEntityQueryWhereDistinct
    on
        QueryBuilder<
          SectionStatsStateEntity,
          SectionStatsStateEntity,
          QDistinct
        > {
  QueryBuilder<SectionStatsStateEntity, SectionStatsStateEntity, QDistinct>
  distinctByDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'deletedAt');
    });
  }

  QueryBuilder<SectionStatsStateEntity, SectionStatsStateEntity, QDistinct>
  distinctByDuplicateStickers() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'duplicateStickers');
    });
  }

  QueryBuilder<SectionStatsStateEntity, SectionStatsStateEntity, QDistinct>
  distinctByMissingStickers() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'missingStickers');
    });
  }

  QueryBuilder<SectionStatsStateEntity, SectionStatsStateEntity, QDistinct>
  distinctByObtainedStickers() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'obtainedStickers');
    });
  }

  QueryBuilder<SectionStatsStateEntity, SectionStatsStateEntity, QDistinct>
  distinctByProgress() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'progress');
    });
  }

  QueryBuilder<SectionStatsStateEntity, SectionStatsStateEntity, QDistinct>
  distinctBySectionId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sectionId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SectionStatsStateEntity, SectionStatsStateEntity, QDistinct>
  distinctBySectionStatsId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'sectionStatsId',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<SectionStatsStateEntity, SectionStatsStateEntity, QDistinct>
  distinctByTotalStickers() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalStickers');
    });
  }

  QueryBuilder<SectionStatsStateEntity, SectionStatsStateEntity, QDistinct>
  distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }

  QueryBuilder<SectionStatsStateEntity, SectionStatsStateEntity, QDistinct>
  distinctByUserAlbumId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userAlbumId', caseSensitive: caseSensitive);
    });
  }
}

extension SectionStatsStateEntityQueryProperty
    on
        QueryBuilder<
          SectionStatsStateEntity,
          SectionStatsStateEntity,
          QQueryProperty
        > {
  QueryBuilder<SectionStatsStateEntity, int, QQueryOperations>
  isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarId');
    });
  }

  QueryBuilder<SectionStatsStateEntity, DateTime?, QQueryOperations>
  deletedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'deletedAt');
    });
  }

  QueryBuilder<SectionStatsStateEntity, int, QQueryOperations>
  duplicateStickersProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'duplicateStickers');
    });
  }

  QueryBuilder<SectionStatsStateEntity, int, QQueryOperations>
  missingStickersProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'missingStickers');
    });
  }

  QueryBuilder<SectionStatsStateEntity, int, QQueryOperations>
  obtainedStickersProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'obtainedStickers');
    });
  }

  QueryBuilder<SectionStatsStateEntity, double, QQueryOperations>
  progressProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'progress');
    });
  }

  QueryBuilder<SectionStatsStateEntity, String, QQueryOperations>
  sectionIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sectionId');
    });
  }

  QueryBuilder<SectionStatsStateEntity, String, QQueryOperations>
  sectionStatsIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sectionStatsId');
    });
  }

  QueryBuilder<SectionStatsStateEntity, int, QQueryOperations>
  totalStickersProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalStickers');
    });
  }

  QueryBuilder<SectionStatsStateEntity, DateTime, QQueryOperations>
  updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }

  QueryBuilder<SectionStatsStateEntity, String, QQueryOperations>
  userAlbumIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userAlbumId');
    });
  }
}
