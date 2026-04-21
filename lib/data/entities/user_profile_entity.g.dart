// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile_entity.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetUserProfileEntityCollection on Isar {
  IsarCollection<UserProfileEntity> get userProfileEntitys => this.collection();
}

const CollectionSchema<UserProfileEntity> UserProfileEntitySchema =
    CollectionSchema(
      name: r'UserProfileEntity',
      id: -588086384777568406,
      properties: {
        r'createdAt': PropertySchema(
          id: 0,
          name: r'createdAt',
          type: IsarType.dateTime,
        ),
        r'displayName': PropertySchema(
          id: 1,
          name: r'displayName',
          type: IsarType.string,
        ),
        r'hasSeenHowItWorksOnStickerClick': PropertySchema(
          id: 2,
          name: r'hasSeenHowItWorksOnStickerClick',
          type: IsarType.bool,
        ),
        r'profileId': PropertySchema(
          id: 3,
          name: r'profileId',
          type: IsarType.string,
        ),
        r'remoteUid': PropertySchema(
          id: 4,
          name: r'remoteUid',
          type: IsarType.string,
        ),
        r'updatedAt': PropertySchema(
          id: 5,
          name: r'updatedAt',
          type: IsarType.dateTime,
        ),
      },

      estimateSize: _userProfileEntityEstimateSize,
      serialize: _userProfileEntitySerialize,
      deserialize: _userProfileEntityDeserialize,
      deserializeProp: _userProfileEntityDeserializeProp,
      idName: r'isarId',
      indexes: {
        r'profileId': IndexSchema(
          id: 6052971939042612300,
          name: r'profileId',
          unique: true,
          replace: true,
          properties: [
            IndexPropertySchema(
              name: r'profileId',
              type: IndexType.hash,
              caseSensitive: true,
            ),
          ],
        ),
        r'remoteUid': IndexSchema(
          id: -3390609444462227290,
          name: r'remoteUid',
          unique: false,
          replace: false,
          properties: [
            IndexPropertySchema(
              name: r'remoteUid',
              type: IndexType.hash,
              caseSensitive: true,
            ),
          ],
        ),
      },
      links: {},
      embeddedSchemas: {},

      getId: _userProfileEntityGetId,
      getLinks: _userProfileEntityGetLinks,
      attach: _userProfileEntityAttach,
      version: '3.3.0',
    );

int _userProfileEntityEstimateSize(
  UserProfileEntity object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.displayName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.profileId.length * 3;
  {
    final value = object.remoteUid;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _userProfileEntitySerialize(
  UserProfileEntity object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.createdAt);
  writer.writeString(offsets[1], object.displayName);
  writer.writeBool(offsets[2], object.hasSeenHowItWorksOnStickerClick);
  writer.writeString(offsets[3], object.profileId);
  writer.writeString(offsets[4], object.remoteUid);
  writer.writeDateTime(offsets[5], object.updatedAt);
}

UserProfileEntity _userProfileEntityDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = UserProfileEntity();
  object.createdAt = reader.readDateTime(offsets[0]);
  object.displayName = reader.readStringOrNull(offsets[1]);
  object.hasSeenHowItWorksOnStickerClick = reader.readBool(offsets[2]);
  object.isarId = id;
  object.profileId = reader.readString(offsets[3]);
  object.remoteUid = reader.readStringOrNull(offsets[4]);
  object.updatedAt = reader.readDateTime(offsets[5]);
  return object;
}

P _userProfileEntityDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readBool(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readDateTime(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _userProfileEntityGetId(UserProfileEntity object) {
  return object.isarId;
}

List<IsarLinkBase<dynamic>> _userProfileEntityGetLinks(
  UserProfileEntity object,
) {
  return [];
}

void _userProfileEntityAttach(
  IsarCollection<dynamic> col,
  Id id,
  UserProfileEntity object,
) {
  object.isarId = id;
}

extension UserProfileEntityByIndex on IsarCollection<UserProfileEntity> {
  Future<UserProfileEntity?> getByProfileId(String profileId) {
    return getByIndex(r'profileId', [profileId]);
  }

  UserProfileEntity? getByProfileIdSync(String profileId) {
    return getByIndexSync(r'profileId', [profileId]);
  }

  Future<bool> deleteByProfileId(String profileId) {
    return deleteByIndex(r'profileId', [profileId]);
  }

  bool deleteByProfileIdSync(String profileId) {
    return deleteByIndexSync(r'profileId', [profileId]);
  }

  Future<List<UserProfileEntity?>> getAllByProfileId(
    List<String> profileIdValues,
  ) {
    final values = profileIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'profileId', values);
  }

  List<UserProfileEntity?> getAllByProfileIdSync(List<String> profileIdValues) {
    final values = profileIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'profileId', values);
  }

  Future<int> deleteAllByProfileId(List<String> profileIdValues) {
    final values = profileIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'profileId', values);
  }

  int deleteAllByProfileIdSync(List<String> profileIdValues) {
    final values = profileIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'profileId', values);
  }

  Future<Id> putByProfileId(UserProfileEntity object) {
    return putByIndex(r'profileId', object);
  }

  Id putByProfileIdSync(UserProfileEntity object, {bool saveLinks = true}) {
    return putByIndexSync(r'profileId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByProfileId(List<UserProfileEntity> objects) {
    return putAllByIndex(r'profileId', objects);
  }

  List<Id> putAllByProfileIdSync(
    List<UserProfileEntity> objects, {
    bool saveLinks = true,
  }) {
    return putAllByIndexSync(r'profileId', objects, saveLinks: saveLinks);
  }
}

extension UserProfileEntityQueryWhereSort
    on QueryBuilder<UserProfileEntity, UserProfileEntity, QWhere> {
  QueryBuilder<UserProfileEntity, UserProfileEntity, QAfterWhere> anyIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension UserProfileEntityQueryWhere
    on QueryBuilder<UserProfileEntity, UserProfileEntity, QWhereClause> {
  QueryBuilder<UserProfileEntity, UserProfileEntity, QAfterWhereClause>
  isarIdEqualTo(Id isarId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.between(lower: isarId, upper: isarId),
      );
    });
  }

  QueryBuilder<UserProfileEntity, UserProfileEntity, QAfterWhereClause>
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

  QueryBuilder<UserProfileEntity, UserProfileEntity, QAfterWhereClause>
  isarIdGreaterThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarId, includeLower: include),
      );
    });
  }

  QueryBuilder<UserProfileEntity, UserProfileEntity, QAfterWhereClause>
  isarIdLessThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarId, includeUpper: include),
      );
    });
  }

  QueryBuilder<UserProfileEntity, UserProfileEntity, QAfterWhereClause>
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

  QueryBuilder<UserProfileEntity, UserProfileEntity, QAfterWhereClause>
  profileIdEqualTo(String profileId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'profileId', value: [profileId]),
      );
    });
  }

  QueryBuilder<UserProfileEntity, UserProfileEntity, QAfterWhereClause>
  profileIdNotEqualTo(String profileId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'profileId',
                lower: [],
                upper: [profileId],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'profileId',
                lower: [profileId],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'profileId',
                lower: [profileId],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'profileId',
                lower: [],
                upper: [profileId],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<UserProfileEntity, UserProfileEntity, QAfterWhereClause>
  remoteUidIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'remoteUid', value: [null]),
      );
    });
  }

  QueryBuilder<UserProfileEntity, UserProfileEntity, QAfterWhereClause>
  remoteUidIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'remoteUid',
          lower: [null],
          includeLower: false,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<UserProfileEntity, UserProfileEntity, QAfterWhereClause>
  remoteUidEqualTo(String? remoteUid) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'remoteUid', value: [remoteUid]),
      );
    });
  }

  QueryBuilder<UserProfileEntity, UserProfileEntity, QAfterWhereClause>
  remoteUidNotEqualTo(String? remoteUid) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'remoteUid',
                lower: [],
                upper: [remoteUid],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'remoteUid',
                lower: [remoteUid],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'remoteUid',
                lower: [remoteUid],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'remoteUid',
                lower: [],
                upper: [remoteUid],
                includeUpper: false,
              ),
            );
      }
    });
  }
}

extension UserProfileEntityQueryFilter
    on QueryBuilder<UserProfileEntity, UserProfileEntity, QFilterCondition> {
  QueryBuilder<UserProfileEntity, UserProfileEntity, QAfterFilterCondition>
  createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'createdAt', value: value),
      );
    });
  }

  QueryBuilder<UserProfileEntity, UserProfileEntity, QAfterFilterCondition>
  createdAtGreaterThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'createdAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<UserProfileEntity, UserProfileEntity, QAfterFilterCondition>
  createdAtLessThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'createdAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<UserProfileEntity, UserProfileEntity, QAfterFilterCondition>
  createdAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'createdAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<UserProfileEntity, UserProfileEntity, QAfterFilterCondition>
  displayNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'displayName'),
      );
    });
  }

  QueryBuilder<UserProfileEntity, UserProfileEntity, QAfterFilterCondition>
  displayNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'displayName'),
      );
    });
  }

  QueryBuilder<UserProfileEntity, UserProfileEntity, QAfterFilterCondition>
  displayNameEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'displayName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<UserProfileEntity, UserProfileEntity, QAfterFilterCondition>
  displayNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'displayName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<UserProfileEntity, UserProfileEntity, QAfterFilterCondition>
  displayNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'displayName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<UserProfileEntity, UserProfileEntity, QAfterFilterCondition>
  displayNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'displayName',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<UserProfileEntity, UserProfileEntity, QAfterFilterCondition>
  displayNameStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'displayName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<UserProfileEntity, UserProfileEntity, QAfterFilterCondition>
  displayNameEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'displayName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<UserProfileEntity, UserProfileEntity, QAfterFilterCondition>
  displayNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'displayName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<UserProfileEntity, UserProfileEntity, QAfterFilterCondition>
  displayNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'displayName',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<UserProfileEntity, UserProfileEntity, QAfterFilterCondition>
  displayNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'displayName', value: ''),
      );
    });
  }

  QueryBuilder<UserProfileEntity, UserProfileEntity, QAfterFilterCondition>
  displayNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'displayName', value: ''),
      );
    });
  }

  QueryBuilder<UserProfileEntity, UserProfileEntity, QAfterFilterCondition>
  hasSeenHowItWorksOnStickerClickEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'hasSeenHowItWorksOnStickerClick',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<UserProfileEntity, UserProfileEntity, QAfterFilterCondition>
  isarIdEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'isarId', value: value),
      );
    });
  }

  QueryBuilder<UserProfileEntity, UserProfileEntity, QAfterFilterCondition>
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

  QueryBuilder<UserProfileEntity, UserProfileEntity, QAfterFilterCondition>
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

  QueryBuilder<UserProfileEntity, UserProfileEntity, QAfterFilterCondition>
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

  QueryBuilder<UserProfileEntity, UserProfileEntity, QAfterFilterCondition>
  profileIdEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'profileId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<UserProfileEntity, UserProfileEntity, QAfterFilterCondition>
  profileIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'profileId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<UserProfileEntity, UserProfileEntity, QAfterFilterCondition>
  profileIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'profileId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<UserProfileEntity, UserProfileEntity, QAfterFilterCondition>
  profileIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'profileId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<UserProfileEntity, UserProfileEntity, QAfterFilterCondition>
  profileIdStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'profileId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<UserProfileEntity, UserProfileEntity, QAfterFilterCondition>
  profileIdEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'profileId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<UserProfileEntity, UserProfileEntity, QAfterFilterCondition>
  profileIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'profileId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<UserProfileEntity, UserProfileEntity, QAfterFilterCondition>
  profileIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'profileId',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<UserProfileEntity, UserProfileEntity, QAfterFilterCondition>
  profileIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'profileId', value: ''),
      );
    });
  }

  QueryBuilder<UserProfileEntity, UserProfileEntity, QAfterFilterCondition>
  profileIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'profileId', value: ''),
      );
    });
  }

  QueryBuilder<UserProfileEntity, UserProfileEntity, QAfterFilterCondition>
  remoteUidIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'remoteUid'),
      );
    });
  }

  QueryBuilder<UserProfileEntity, UserProfileEntity, QAfterFilterCondition>
  remoteUidIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'remoteUid'),
      );
    });
  }

  QueryBuilder<UserProfileEntity, UserProfileEntity, QAfterFilterCondition>
  remoteUidEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'remoteUid',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<UserProfileEntity, UserProfileEntity, QAfterFilterCondition>
  remoteUidGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'remoteUid',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<UserProfileEntity, UserProfileEntity, QAfterFilterCondition>
  remoteUidLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'remoteUid',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<UserProfileEntity, UserProfileEntity, QAfterFilterCondition>
  remoteUidBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'remoteUid',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<UserProfileEntity, UserProfileEntity, QAfterFilterCondition>
  remoteUidStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'remoteUid',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<UserProfileEntity, UserProfileEntity, QAfterFilterCondition>
  remoteUidEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'remoteUid',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<UserProfileEntity, UserProfileEntity, QAfterFilterCondition>
  remoteUidContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'remoteUid',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<UserProfileEntity, UserProfileEntity, QAfterFilterCondition>
  remoteUidMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'remoteUid',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<UserProfileEntity, UserProfileEntity, QAfterFilterCondition>
  remoteUidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'remoteUid', value: ''),
      );
    });
  }

  QueryBuilder<UserProfileEntity, UserProfileEntity, QAfterFilterCondition>
  remoteUidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'remoteUid', value: ''),
      );
    });
  }

  QueryBuilder<UserProfileEntity, UserProfileEntity, QAfterFilterCondition>
  updatedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'updatedAt', value: value),
      );
    });
  }

  QueryBuilder<UserProfileEntity, UserProfileEntity, QAfterFilterCondition>
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

  QueryBuilder<UserProfileEntity, UserProfileEntity, QAfterFilterCondition>
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

  QueryBuilder<UserProfileEntity, UserProfileEntity, QAfterFilterCondition>
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
}

extension UserProfileEntityQueryObject
    on QueryBuilder<UserProfileEntity, UserProfileEntity, QFilterCondition> {}

extension UserProfileEntityQueryLinks
    on QueryBuilder<UserProfileEntity, UserProfileEntity, QFilterCondition> {}

extension UserProfileEntityQuerySortBy
    on QueryBuilder<UserProfileEntity, UserProfileEntity, QSortBy> {
  QueryBuilder<UserProfileEntity, UserProfileEntity, QAfterSortBy>
  sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<UserProfileEntity, UserProfileEntity, QAfterSortBy>
  sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<UserProfileEntity, UserProfileEntity, QAfterSortBy>
  sortByDisplayName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayName', Sort.asc);
    });
  }

  QueryBuilder<UserProfileEntity, UserProfileEntity, QAfterSortBy>
  sortByDisplayNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayName', Sort.desc);
    });
  }

  QueryBuilder<UserProfileEntity, UserProfileEntity, QAfterSortBy>
  sortByHasSeenHowItWorksOnStickerClick() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasSeenHowItWorksOnStickerClick', Sort.asc);
    });
  }

  QueryBuilder<UserProfileEntity, UserProfileEntity, QAfterSortBy>
  sortByHasSeenHowItWorksOnStickerClickDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasSeenHowItWorksOnStickerClick', Sort.desc);
    });
  }

  QueryBuilder<UserProfileEntity, UserProfileEntity, QAfterSortBy>
  sortByProfileId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'profileId', Sort.asc);
    });
  }

  QueryBuilder<UserProfileEntity, UserProfileEntity, QAfterSortBy>
  sortByProfileIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'profileId', Sort.desc);
    });
  }

  QueryBuilder<UserProfileEntity, UserProfileEntity, QAfterSortBy>
  sortByRemoteUid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteUid', Sort.asc);
    });
  }

  QueryBuilder<UserProfileEntity, UserProfileEntity, QAfterSortBy>
  sortByRemoteUidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteUid', Sort.desc);
    });
  }

  QueryBuilder<UserProfileEntity, UserProfileEntity, QAfterSortBy>
  sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<UserProfileEntity, UserProfileEntity, QAfterSortBy>
  sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension UserProfileEntityQuerySortThenBy
    on QueryBuilder<UserProfileEntity, UserProfileEntity, QSortThenBy> {
  QueryBuilder<UserProfileEntity, UserProfileEntity, QAfterSortBy>
  thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<UserProfileEntity, UserProfileEntity, QAfterSortBy>
  thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<UserProfileEntity, UserProfileEntity, QAfterSortBy>
  thenByDisplayName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayName', Sort.asc);
    });
  }

  QueryBuilder<UserProfileEntity, UserProfileEntity, QAfterSortBy>
  thenByDisplayNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayName', Sort.desc);
    });
  }

  QueryBuilder<UserProfileEntity, UserProfileEntity, QAfterSortBy>
  thenByHasSeenHowItWorksOnStickerClick() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasSeenHowItWorksOnStickerClick', Sort.asc);
    });
  }

  QueryBuilder<UserProfileEntity, UserProfileEntity, QAfterSortBy>
  thenByHasSeenHowItWorksOnStickerClickDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasSeenHowItWorksOnStickerClick', Sort.desc);
    });
  }

  QueryBuilder<UserProfileEntity, UserProfileEntity, QAfterSortBy>
  thenByIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.asc);
    });
  }

  QueryBuilder<UserProfileEntity, UserProfileEntity, QAfterSortBy>
  thenByIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.desc);
    });
  }

  QueryBuilder<UserProfileEntity, UserProfileEntity, QAfterSortBy>
  thenByProfileId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'profileId', Sort.asc);
    });
  }

  QueryBuilder<UserProfileEntity, UserProfileEntity, QAfterSortBy>
  thenByProfileIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'profileId', Sort.desc);
    });
  }

  QueryBuilder<UserProfileEntity, UserProfileEntity, QAfterSortBy>
  thenByRemoteUid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteUid', Sort.asc);
    });
  }

  QueryBuilder<UserProfileEntity, UserProfileEntity, QAfterSortBy>
  thenByRemoteUidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteUid', Sort.desc);
    });
  }

  QueryBuilder<UserProfileEntity, UserProfileEntity, QAfterSortBy>
  thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<UserProfileEntity, UserProfileEntity, QAfterSortBy>
  thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension UserProfileEntityQueryWhereDistinct
    on QueryBuilder<UserProfileEntity, UserProfileEntity, QDistinct> {
  QueryBuilder<UserProfileEntity, UserProfileEntity, QDistinct>
  distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<UserProfileEntity, UserProfileEntity, QDistinct>
  distinctByDisplayName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'displayName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UserProfileEntity, UserProfileEntity, QDistinct>
  distinctByHasSeenHowItWorksOnStickerClick() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hasSeenHowItWorksOnStickerClick');
    });
  }

  QueryBuilder<UserProfileEntity, UserProfileEntity, QDistinct>
  distinctByProfileId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'profileId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UserProfileEntity, UserProfileEntity, QDistinct>
  distinctByRemoteUid({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'remoteUid', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UserProfileEntity, UserProfileEntity, QDistinct>
  distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }
}

extension UserProfileEntityQueryProperty
    on QueryBuilder<UserProfileEntity, UserProfileEntity, QQueryProperty> {
  QueryBuilder<UserProfileEntity, int, QQueryOperations> isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarId');
    });
  }

  QueryBuilder<UserProfileEntity, DateTime, QQueryOperations>
  createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<UserProfileEntity, String?, QQueryOperations>
  displayNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'displayName');
    });
  }

  QueryBuilder<UserProfileEntity, bool, QQueryOperations>
  hasSeenHowItWorksOnStickerClickProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hasSeenHowItWorksOnStickerClick');
    });
  }

  QueryBuilder<UserProfileEntity, String, QQueryOperations>
  profileIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'profileId');
    });
  }

  QueryBuilder<UserProfileEntity, String?, QQueryOperations>
  remoteUidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'remoteUid');
    });
  }

  QueryBuilder<UserProfileEntity, DateTime, QQueryOperations>
  updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }
}
