// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sticker_state_entity.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetStickerStateEntityCollection on Isar {
  IsarCollection<StickerStateEntity> get stickerStateEntitys =>
      this.collection();
}

const CollectionSchema<StickerStateEntity>
StickerStateEntitySchema = CollectionSchema(
  name: r'StickerStateEntity',
  id: 6680143280154914328,
  properties: {
    r'code': PropertySchema(id: 0, name: r'code', type: IsarType.string),
    r'deletedAt': PropertySchema(
      id: 1,
      name: r'deletedAt',
      type: IsarType.dateTime,
    ),
    r'forTrade': PropertySchema(id: 2, name: r'forTrade', type: IsarType.bool),
    r'note': PropertySchema(id: 3, name: r'note', type: IsarType.string),
    r'quantity': PropertySchema(id: 4, name: r'quantity', type: IsarType.long),
    r'stateId': PropertySchema(id: 5, name: r'stateId', type: IsarType.string),
    r'updatedAt': PropertySchema(
      id: 6,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
    r'userAlbumId': PropertySchema(
      id: 7,
      name: r'userAlbumId',
      type: IsarType.string,
    ),
    r'wanted': PropertySchema(id: 8, name: r'wanted', type: IsarType.bool),
  },

  estimateSize: _stickerStateEntityEstimateSize,
  serialize: _stickerStateEntitySerialize,
  deserialize: _stickerStateEntityDeserialize,
  deserializeProp: _stickerStateEntityDeserializeProp,
  idName: r'isarId',
  indexes: {
    r'stateId': IndexSchema(
      id: -1428154555284842722,
      name: r'stateId',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'stateId',
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
    r'code': IndexSchema(
      id: 329780482934683790,
      name: r'code',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'code',
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

  getId: _stickerStateEntityGetId,
  getLinks: _stickerStateEntityGetLinks,
  attach: _stickerStateEntityAttach,
  version: '3.3.0',
);

int _stickerStateEntityEstimateSize(
  StickerStateEntity object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.code.length * 3;
  {
    final value = object.note;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.stateId.length * 3;
  bytesCount += 3 + object.userAlbumId.length * 3;
  return bytesCount;
}

void _stickerStateEntitySerialize(
  StickerStateEntity object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.code);
  writer.writeDateTime(offsets[1], object.deletedAt);
  writer.writeBool(offsets[2], object.forTrade);
  writer.writeString(offsets[3], object.note);
  writer.writeLong(offsets[4], object.quantity);
  writer.writeString(offsets[5], object.stateId);
  writer.writeDateTime(offsets[6], object.updatedAt);
  writer.writeString(offsets[7], object.userAlbumId);
  writer.writeBool(offsets[8], object.wanted);
}

StickerStateEntity _stickerStateEntityDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = StickerStateEntity();
  object.code = reader.readString(offsets[0]);
  object.deletedAt = reader.readDateTimeOrNull(offsets[1]);
  object.forTrade = reader.readBool(offsets[2]);
  object.isarId = id;
  object.note = reader.readStringOrNull(offsets[3]);
  object.quantity = reader.readLong(offsets[4]);
  object.stateId = reader.readString(offsets[5]);
  object.updatedAt = reader.readDateTime(offsets[6]);
  object.userAlbumId = reader.readString(offsets[7]);
  object.wanted = reader.readBool(offsets[8]);
  return object;
}

P _stickerStateEntityDeserializeProp<P>(
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
      return (reader.readBool(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readDateTime(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (reader.readBool(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _stickerStateEntityGetId(StickerStateEntity object) {
  return object.isarId;
}

List<IsarLinkBase<dynamic>> _stickerStateEntityGetLinks(
  StickerStateEntity object,
) {
  return [];
}

void _stickerStateEntityAttach(
  IsarCollection<dynamic> col,
  Id id,
  StickerStateEntity object,
) {
  object.isarId = id;
}

extension StickerStateEntityByIndex on IsarCollection<StickerStateEntity> {
  Future<StickerStateEntity?> getByStateId(String stateId) {
    return getByIndex(r'stateId', [stateId]);
  }

  StickerStateEntity? getByStateIdSync(String stateId) {
    return getByIndexSync(r'stateId', [stateId]);
  }

  Future<bool> deleteByStateId(String stateId) {
    return deleteByIndex(r'stateId', [stateId]);
  }

  bool deleteByStateIdSync(String stateId) {
    return deleteByIndexSync(r'stateId', [stateId]);
  }

  Future<List<StickerStateEntity?>> getAllByStateId(
    List<String> stateIdValues,
  ) {
    final values = stateIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'stateId', values);
  }

  List<StickerStateEntity?> getAllByStateIdSync(List<String> stateIdValues) {
    final values = stateIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'stateId', values);
  }

  Future<int> deleteAllByStateId(List<String> stateIdValues) {
    final values = stateIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'stateId', values);
  }

  int deleteAllByStateIdSync(List<String> stateIdValues) {
    final values = stateIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'stateId', values);
  }

  Future<Id> putByStateId(StickerStateEntity object) {
    return putByIndex(r'stateId', object);
  }

  Id putByStateIdSync(StickerStateEntity object, {bool saveLinks = true}) {
    return putByIndexSync(r'stateId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByStateId(List<StickerStateEntity> objects) {
    return putAllByIndex(r'stateId', objects);
  }

  List<Id> putAllByStateIdSync(
    List<StickerStateEntity> objects, {
    bool saveLinks = true,
  }) {
    return putAllByIndexSync(r'stateId', objects, saveLinks: saveLinks);
  }
}

extension StickerStateEntityQueryWhereSort
    on QueryBuilder<StickerStateEntity, StickerStateEntity, QWhere> {
  QueryBuilder<StickerStateEntity, StickerStateEntity, QAfterWhere>
  anyIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<StickerStateEntity, StickerStateEntity, QAfterWhere>
  anyUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'updatedAt'),
      );
    });
  }
}

extension StickerStateEntityQueryWhere
    on QueryBuilder<StickerStateEntity, StickerStateEntity, QWhereClause> {
  QueryBuilder<StickerStateEntity, StickerStateEntity, QAfterWhereClause>
  isarIdEqualTo(Id isarId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.between(lower: isarId, upper: isarId),
      );
    });
  }

  QueryBuilder<StickerStateEntity, StickerStateEntity, QAfterWhereClause>
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

  QueryBuilder<StickerStateEntity, StickerStateEntity, QAfterWhereClause>
  isarIdGreaterThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarId, includeLower: include),
      );
    });
  }

  QueryBuilder<StickerStateEntity, StickerStateEntity, QAfterWhereClause>
  isarIdLessThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarId, includeUpper: include),
      );
    });
  }

  QueryBuilder<StickerStateEntity, StickerStateEntity, QAfterWhereClause>
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

  QueryBuilder<StickerStateEntity, StickerStateEntity, QAfterWhereClause>
  stateIdEqualTo(String stateId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'stateId', value: [stateId]),
      );
    });
  }

  QueryBuilder<StickerStateEntity, StickerStateEntity, QAfterWhereClause>
  stateIdNotEqualTo(String stateId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'stateId',
                lower: [],
                upper: [stateId],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'stateId',
                lower: [stateId],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'stateId',
                lower: [stateId],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'stateId',
                lower: [],
                upper: [stateId],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<StickerStateEntity, StickerStateEntity, QAfterWhereClause>
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

  QueryBuilder<StickerStateEntity, StickerStateEntity, QAfterWhereClause>
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

  QueryBuilder<StickerStateEntity, StickerStateEntity, QAfterWhereClause>
  codeEqualTo(String code) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'code', value: [code]),
      );
    });
  }

  QueryBuilder<StickerStateEntity, StickerStateEntity, QAfterWhereClause>
  codeNotEqualTo(String code) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'code',
                lower: [],
                upper: [code],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'code',
                lower: [code],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'code',
                lower: [code],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'code',
                lower: [],
                upper: [code],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<StickerStateEntity, StickerStateEntity, QAfterWhereClause>
  updatedAtEqualTo(DateTime updatedAt) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'updatedAt', value: [updatedAt]),
      );
    });
  }

  QueryBuilder<StickerStateEntity, StickerStateEntity, QAfterWhereClause>
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

  QueryBuilder<StickerStateEntity, StickerStateEntity, QAfterWhereClause>
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

  QueryBuilder<StickerStateEntity, StickerStateEntity, QAfterWhereClause>
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

  QueryBuilder<StickerStateEntity, StickerStateEntity, QAfterWhereClause>
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

extension StickerStateEntityQueryFilter
    on QueryBuilder<StickerStateEntity, StickerStateEntity, QFilterCondition> {
  QueryBuilder<StickerStateEntity, StickerStateEntity, QAfterFilterCondition>
  codeEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'code',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<StickerStateEntity, StickerStateEntity, QAfterFilterCondition>
  codeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'code',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<StickerStateEntity, StickerStateEntity, QAfterFilterCondition>
  codeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'code',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<StickerStateEntity, StickerStateEntity, QAfterFilterCondition>
  codeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'code',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<StickerStateEntity, StickerStateEntity, QAfterFilterCondition>
  codeStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'code',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<StickerStateEntity, StickerStateEntity, QAfterFilterCondition>
  codeEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'code',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<StickerStateEntity, StickerStateEntity, QAfterFilterCondition>
  codeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'code',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<StickerStateEntity, StickerStateEntity, QAfterFilterCondition>
  codeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'code',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<StickerStateEntity, StickerStateEntity, QAfterFilterCondition>
  codeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'code', value: ''),
      );
    });
  }

  QueryBuilder<StickerStateEntity, StickerStateEntity, QAfterFilterCondition>
  codeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'code', value: ''),
      );
    });
  }

  QueryBuilder<StickerStateEntity, StickerStateEntity, QAfterFilterCondition>
  deletedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'deletedAt'),
      );
    });
  }

  QueryBuilder<StickerStateEntity, StickerStateEntity, QAfterFilterCondition>
  deletedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'deletedAt'),
      );
    });
  }

  QueryBuilder<StickerStateEntity, StickerStateEntity, QAfterFilterCondition>
  deletedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'deletedAt', value: value),
      );
    });
  }

  QueryBuilder<StickerStateEntity, StickerStateEntity, QAfterFilterCondition>
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

  QueryBuilder<StickerStateEntity, StickerStateEntity, QAfterFilterCondition>
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

  QueryBuilder<StickerStateEntity, StickerStateEntity, QAfterFilterCondition>
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

  QueryBuilder<StickerStateEntity, StickerStateEntity, QAfterFilterCondition>
  forTradeEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'forTrade', value: value),
      );
    });
  }

  QueryBuilder<StickerStateEntity, StickerStateEntity, QAfterFilterCondition>
  isarIdEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'isarId', value: value),
      );
    });
  }

  QueryBuilder<StickerStateEntity, StickerStateEntity, QAfterFilterCondition>
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

  QueryBuilder<StickerStateEntity, StickerStateEntity, QAfterFilterCondition>
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

  QueryBuilder<StickerStateEntity, StickerStateEntity, QAfterFilterCondition>
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

  QueryBuilder<StickerStateEntity, StickerStateEntity, QAfterFilterCondition>
  noteIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'note'),
      );
    });
  }

  QueryBuilder<StickerStateEntity, StickerStateEntity, QAfterFilterCondition>
  noteIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'note'),
      );
    });
  }

  QueryBuilder<StickerStateEntity, StickerStateEntity, QAfterFilterCondition>
  noteEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'note',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<StickerStateEntity, StickerStateEntity, QAfterFilterCondition>
  noteGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'note',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<StickerStateEntity, StickerStateEntity, QAfterFilterCondition>
  noteLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'note',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<StickerStateEntity, StickerStateEntity, QAfterFilterCondition>
  noteBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'note',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<StickerStateEntity, StickerStateEntity, QAfterFilterCondition>
  noteStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'note',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<StickerStateEntity, StickerStateEntity, QAfterFilterCondition>
  noteEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'note',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<StickerStateEntity, StickerStateEntity, QAfterFilterCondition>
  noteContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'note',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<StickerStateEntity, StickerStateEntity, QAfterFilterCondition>
  noteMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'note',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<StickerStateEntity, StickerStateEntity, QAfterFilterCondition>
  noteIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'note', value: ''),
      );
    });
  }

  QueryBuilder<StickerStateEntity, StickerStateEntity, QAfterFilterCondition>
  noteIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'note', value: ''),
      );
    });
  }

  QueryBuilder<StickerStateEntity, StickerStateEntity, QAfterFilterCondition>
  quantityEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'quantity', value: value),
      );
    });
  }

  QueryBuilder<StickerStateEntity, StickerStateEntity, QAfterFilterCondition>
  quantityGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'quantity',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<StickerStateEntity, StickerStateEntity, QAfterFilterCondition>
  quantityLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'quantity',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<StickerStateEntity, StickerStateEntity, QAfterFilterCondition>
  quantityBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'quantity',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<StickerStateEntity, StickerStateEntity, QAfterFilterCondition>
  stateIdEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'stateId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<StickerStateEntity, StickerStateEntity, QAfterFilterCondition>
  stateIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'stateId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<StickerStateEntity, StickerStateEntity, QAfterFilterCondition>
  stateIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'stateId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<StickerStateEntity, StickerStateEntity, QAfterFilterCondition>
  stateIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'stateId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<StickerStateEntity, StickerStateEntity, QAfterFilterCondition>
  stateIdStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'stateId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<StickerStateEntity, StickerStateEntity, QAfterFilterCondition>
  stateIdEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'stateId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<StickerStateEntity, StickerStateEntity, QAfterFilterCondition>
  stateIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'stateId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<StickerStateEntity, StickerStateEntity, QAfterFilterCondition>
  stateIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'stateId',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<StickerStateEntity, StickerStateEntity, QAfterFilterCondition>
  stateIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'stateId', value: ''),
      );
    });
  }

  QueryBuilder<StickerStateEntity, StickerStateEntity, QAfterFilterCondition>
  stateIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'stateId', value: ''),
      );
    });
  }

  QueryBuilder<StickerStateEntity, StickerStateEntity, QAfterFilterCondition>
  updatedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'updatedAt', value: value),
      );
    });
  }

  QueryBuilder<StickerStateEntity, StickerStateEntity, QAfterFilterCondition>
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

  QueryBuilder<StickerStateEntity, StickerStateEntity, QAfterFilterCondition>
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

  QueryBuilder<StickerStateEntity, StickerStateEntity, QAfterFilterCondition>
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

  QueryBuilder<StickerStateEntity, StickerStateEntity, QAfterFilterCondition>
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

  QueryBuilder<StickerStateEntity, StickerStateEntity, QAfterFilterCondition>
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

  QueryBuilder<StickerStateEntity, StickerStateEntity, QAfterFilterCondition>
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

  QueryBuilder<StickerStateEntity, StickerStateEntity, QAfterFilterCondition>
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

  QueryBuilder<StickerStateEntity, StickerStateEntity, QAfterFilterCondition>
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

  QueryBuilder<StickerStateEntity, StickerStateEntity, QAfterFilterCondition>
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

  QueryBuilder<StickerStateEntity, StickerStateEntity, QAfterFilterCondition>
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

  QueryBuilder<StickerStateEntity, StickerStateEntity, QAfterFilterCondition>
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

  QueryBuilder<StickerStateEntity, StickerStateEntity, QAfterFilterCondition>
  userAlbumIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'userAlbumId', value: ''),
      );
    });
  }

  QueryBuilder<StickerStateEntity, StickerStateEntity, QAfterFilterCondition>
  userAlbumIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'userAlbumId', value: ''),
      );
    });
  }

  QueryBuilder<StickerStateEntity, StickerStateEntity, QAfterFilterCondition>
  wantedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'wanted', value: value),
      );
    });
  }
}

extension StickerStateEntityQueryObject
    on QueryBuilder<StickerStateEntity, StickerStateEntity, QFilterCondition> {}

extension StickerStateEntityQueryLinks
    on QueryBuilder<StickerStateEntity, StickerStateEntity, QFilterCondition> {}

extension StickerStateEntityQuerySortBy
    on QueryBuilder<StickerStateEntity, StickerStateEntity, QSortBy> {
  QueryBuilder<StickerStateEntity, StickerStateEntity, QAfterSortBy>
  sortByCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'code', Sort.asc);
    });
  }

  QueryBuilder<StickerStateEntity, StickerStateEntity, QAfterSortBy>
  sortByCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'code', Sort.desc);
    });
  }

  QueryBuilder<StickerStateEntity, StickerStateEntity, QAfterSortBy>
  sortByDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.asc);
    });
  }

  QueryBuilder<StickerStateEntity, StickerStateEntity, QAfterSortBy>
  sortByDeletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.desc);
    });
  }

  QueryBuilder<StickerStateEntity, StickerStateEntity, QAfterSortBy>
  sortByForTrade() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'forTrade', Sort.asc);
    });
  }

  QueryBuilder<StickerStateEntity, StickerStateEntity, QAfterSortBy>
  sortByForTradeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'forTrade', Sort.desc);
    });
  }

  QueryBuilder<StickerStateEntity, StickerStateEntity, QAfterSortBy>
  sortByNote() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'note', Sort.asc);
    });
  }

  QueryBuilder<StickerStateEntity, StickerStateEntity, QAfterSortBy>
  sortByNoteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'note', Sort.desc);
    });
  }

  QueryBuilder<StickerStateEntity, StickerStateEntity, QAfterSortBy>
  sortByQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity', Sort.asc);
    });
  }

  QueryBuilder<StickerStateEntity, StickerStateEntity, QAfterSortBy>
  sortByQuantityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity', Sort.desc);
    });
  }

  QueryBuilder<StickerStateEntity, StickerStateEntity, QAfterSortBy>
  sortByStateId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stateId', Sort.asc);
    });
  }

  QueryBuilder<StickerStateEntity, StickerStateEntity, QAfterSortBy>
  sortByStateIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stateId', Sort.desc);
    });
  }

  QueryBuilder<StickerStateEntity, StickerStateEntity, QAfterSortBy>
  sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<StickerStateEntity, StickerStateEntity, QAfterSortBy>
  sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<StickerStateEntity, StickerStateEntity, QAfterSortBy>
  sortByUserAlbumId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userAlbumId', Sort.asc);
    });
  }

  QueryBuilder<StickerStateEntity, StickerStateEntity, QAfterSortBy>
  sortByUserAlbumIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userAlbumId', Sort.desc);
    });
  }

  QueryBuilder<StickerStateEntity, StickerStateEntity, QAfterSortBy>
  sortByWanted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wanted', Sort.asc);
    });
  }

  QueryBuilder<StickerStateEntity, StickerStateEntity, QAfterSortBy>
  sortByWantedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wanted', Sort.desc);
    });
  }
}

extension StickerStateEntityQuerySortThenBy
    on QueryBuilder<StickerStateEntity, StickerStateEntity, QSortThenBy> {
  QueryBuilder<StickerStateEntity, StickerStateEntity, QAfterSortBy>
  thenByCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'code', Sort.asc);
    });
  }

  QueryBuilder<StickerStateEntity, StickerStateEntity, QAfterSortBy>
  thenByCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'code', Sort.desc);
    });
  }

  QueryBuilder<StickerStateEntity, StickerStateEntity, QAfterSortBy>
  thenByDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.asc);
    });
  }

  QueryBuilder<StickerStateEntity, StickerStateEntity, QAfterSortBy>
  thenByDeletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.desc);
    });
  }

  QueryBuilder<StickerStateEntity, StickerStateEntity, QAfterSortBy>
  thenByForTrade() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'forTrade', Sort.asc);
    });
  }

  QueryBuilder<StickerStateEntity, StickerStateEntity, QAfterSortBy>
  thenByForTradeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'forTrade', Sort.desc);
    });
  }

  QueryBuilder<StickerStateEntity, StickerStateEntity, QAfterSortBy>
  thenByIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.asc);
    });
  }

  QueryBuilder<StickerStateEntity, StickerStateEntity, QAfterSortBy>
  thenByIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.desc);
    });
  }

  QueryBuilder<StickerStateEntity, StickerStateEntity, QAfterSortBy>
  thenByNote() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'note', Sort.asc);
    });
  }

  QueryBuilder<StickerStateEntity, StickerStateEntity, QAfterSortBy>
  thenByNoteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'note', Sort.desc);
    });
  }

  QueryBuilder<StickerStateEntity, StickerStateEntity, QAfterSortBy>
  thenByQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity', Sort.asc);
    });
  }

  QueryBuilder<StickerStateEntity, StickerStateEntity, QAfterSortBy>
  thenByQuantityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity', Sort.desc);
    });
  }

  QueryBuilder<StickerStateEntity, StickerStateEntity, QAfterSortBy>
  thenByStateId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stateId', Sort.asc);
    });
  }

  QueryBuilder<StickerStateEntity, StickerStateEntity, QAfterSortBy>
  thenByStateIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stateId', Sort.desc);
    });
  }

  QueryBuilder<StickerStateEntity, StickerStateEntity, QAfterSortBy>
  thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<StickerStateEntity, StickerStateEntity, QAfterSortBy>
  thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<StickerStateEntity, StickerStateEntity, QAfterSortBy>
  thenByUserAlbumId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userAlbumId', Sort.asc);
    });
  }

  QueryBuilder<StickerStateEntity, StickerStateEntity, QAfterSortBy>
  thenByUserAlbumIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userAlbumId', Sort.desc);
    });
  }

  QueryBuilder<StickerStateEntity, StickerStateEntity, QAfterSortBy>
  thenByWanted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wanted', Sort.asc);
    });
  }

  QueryBuilder<StickerStateEntity, StickerStateEntity, QAfterSortBy>
  thenByWantedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wanted', Sort.desc);
    });
  }
}

extension StickerStateEntityQueryWhereDistinct
    on QueryBuilder<StickerStateEntity, StickerStateEntity, QDistinct> {
  QueryBuilder<StickerStateEntity, StickerStateEntity, QDistinct>
  distinctByCode({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'code', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<StickerStateEntity, StickerStateEntity, QDistinct>
  distinctByDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'deletedAt');
    });
  }

  QueryBuilder<StickerStateEntity, StickerStateEntity, QDistinct>
  distinctByForTrade() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'forTrade');
    });
  }

  QueryBuilder<StickerStateEntity, StickerStateEntity, QDistinct>
  distinctByNote({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'note', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<StickerStateEntity, StickerStateEntity, QDistinct>
  distinctByQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'quantity');
    });
  }

  QueryBuilder<StickerStateEntity, StickerStateEntity, QDistinct>
  distinctByStateId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'stateId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<StickerStateEntity, StickerStateEntity, QDistinct>
  distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }

  QueryBuilder<StickerStateEntity, StickerStateEntity, QDistinct>
  distinctByUserAlbumId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userAlbumId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<StickerStateEntity, StickerStateEntity, QDistinct>
  distinctByWanted() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'wanted');
    });
  }
}

extension StickerStateEntityQueryProperty
    on QueryBuilder<StickerStateEntity, StickerStateEntity, QQueryProperty> {
  QueryBuilder<StickerStateEntity, int, QQueryOperations> isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarId');
    });
  }

  QueryBuilder<StickerStateEntity, String, QQueryOperations> codeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'code');
    });
  }

  QueryBuilder<StickerStateEntity, DateTime?, QQueryOperations>
  deletedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'deletedAt');
    });
  }

  QueryBuilder<StickerStateEntity, bool, QQueryOperations> forTradeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'forTrade');
    });
  }

  QueryBuilder<StickerStateEntity, String?, QQueryOperations> noteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'note');
    });
  }

  QueryBuilder<StickerStateEntity, int, QQueryOperations> quantityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'quantity');
    });
  }

  QueryBuilder<StickerStateEntity, String, QQueryOperations> stateIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'stateId');
    });
  }

  QueryBuilder<StickerStateEntity, DateTime, QQueryOperations>
  updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }

  QueryBuilder<StickerStateEntity, String, QQueryOperations>
  userAlbumIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userAlbumId');
    });
  }

  QueryBuilder<StickerStateEntity, bool, QQueryOperations> wantedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'wanted');
    });
  }
}
