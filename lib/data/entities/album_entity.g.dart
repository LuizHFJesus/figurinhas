// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'album_entity.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetAlbumEntityCollection on Isar {
  IsarCollection<AlbumEntity> get albumEntitys => this.collection();
}

const CollectionSchema<AlbumEntity> AlbumEntitySchema = CollectionSchema(
  name: r'AlbumEntity',
  id: 5722830199791071764,
  properties: {
    r'albumId': PropertySchema(id: 0, name: r'albumId', type: IsarType.string),
    r'catalogHash': PropertySchema(
      id: 1,
      name: r'catalogHash',
      type: IsarType.string,
    ),
    r'catalogVersion': PropertySchema(
      id: 2,
      name: r'catalogVersion',
      type: IsarType.long,
    ),
    r'edition': PropertySchema(id: 3, name: r'edition', type: IsarType.string),
  },

  estimateSize: _albumEntityEstimateSize,
  serialize: _albumEntitySerialize,
  deserialize: _albumEntityDeserialize,
  deserializeProp: _albumEntityDeserializeProp,
  idName: r'isarId',
  indexes: {
    r'albumId': IndexSchema(
      id: -3314078833704812111,
      name: r'albumId',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'albumId',
          type: IndexType.hash,
          caseSensitive: true,
        ),
      ],
    ),
  },
  links: {},
  embeddedSchemas: {},

  getId: _albumEntityGetId,
  getLinks: _albumEntityGetLinks,
  attach: _albumEntityAttach,
  version: '3.3.0',
);

int _albumEntityEstimateSize(
  AlbumEntity object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.albumId.length * 3;
  {
    final value = object.catalogHash;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.edition.length * 3;
  return bytesCount;
}

void _albumEntitySerialize(
  AlbumEntity object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.albumId);
  writer.writeString(offsets[1], object.catalogHash);
  writer.writeLong(offsets[2], object.catalogVersion);
  writer.writeString(offsets[3], object.edition);
}

AlbumEntity _albumEntityDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = AlbumEntity();
  object.albumId = reader.readString(offsets[0]);
  object.catalogHash = reader.readStringOrNull(offsets[1]);
  object.catalogVersion = reader.readLongOrNull(offsets[2]);
  object.edition = reader.readString(offsets[3]);
  object.isarId = id;
  return object;
}

P _albumEntityDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readLongOrNull(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _albumEntityGetId(AlbumEntity object) {
  return object.isarId;
}

List<IsarLinkBase<dynamic>> _albumEntityGetLinks(AlbumEntity object) {
  return [];
}

void _albumEntityAttach(
  IsarCollection<dynamic> col,
  Id id,
  AlbumEntity object,
) {
  object.isarId = id;
}

extension AlbumEntityByIndex on IsarCollection<AlbumEntity> {
  Future<AlbumEntity?> getByAlbumId(String albumId) {
    return getByIndex(r'albumId', [albumId]);
  }

  AlbumEntity? getByAlbumIdSync(String albumId) {
    return getByIndexSync(r'albumId', [albumId]);
  }

  Future<bool> deleteByAlbumId(String albumId) {
    return deleteByIndex(r'albumId', [albumId]);
  }

  bool deleteByAlbumIdSync(String albumId) {
    return deleteByIndexSync(r'albumId', [albumId]);
  }

  Future<List<AlbumEntity?>> getAllByAlbumId(List<String> albumIdValues) {
    final values = albumIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'albumId', values);
  }

  List<AlbumEntity?> getAllByAlbumIdSync(List<String> albumIdValues) {
    final values = albumIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'albumId', values);
  }

  Future<int> deleteAllByAlbumId(List<String> albumIdValues) {
    final values = albumIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'albumId', values);
  }

  int deleteAllByAlbumIdSync(List<String> albumIdValues) {
    final values = albumIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'albumId', values);
  }

  Future<Id> putByAlbumId(AlbumEntity object) {
    return putByIndex(r'albumId', object);
  }

  Id putByAlbumIdSync(AlbumEntity object, {bool saveLinks = true}) {
    return putByIndexSync(r'albumId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByAlbumId(List<AlbumEntity> objects) {
    return putAllByIndex(r'albumId', objects);
  }

  List<Id> putAllByAlbumIdSync(
    List<AlbumEntity> objects, {
    bool saveLinks = true,
  }) {
    return putAllByIndexSync(r'albumId', objects, saveLinks: saveLinks);
  }
}

extension AlbumEntityQueryWhereSort
    on QueryBuilder<AlbumEntity, AlbumEntity, QWhere> {
  QueryBuilder<AlbumEntity, AlbumEntity, QAfterWhere> anyIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension AlbumEntityQueryWhere
    on QueryBuilder<AlbumEntity, AlbumEntity, QWhereClause> {
  QueryBuilder<AlbumEntity, AlbumEntity, QAfterWhereClause> isarIdEqualTo(
    Id isarId,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.between(lower: isarId, upper: isarId),
      );
    });
  }

  QueryBuilder<AlbumEntity, AlbumEntity, QAfterWhereClause> isarIdNotEqualTo(
    Id isarId,
  ) {
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

  QueryBuilder<AlbumEntity, AlbumEntity, QAfterWhereClause> isarIdGreaterThan(
    Id isarId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarId, includeLower: include),
      );
    });
  }

  QueryBuilder<AlbumEntity, AlbumEntity, QAfterWhereClause> isarIdLessThan(
    Id isarId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarId, includeUpper: include),
      );
    });
  }

  QueryBuilder<AlbumEntity, AlbumEntity, QAfterWhereClause> isarIdBetween(
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

  QueryBuilder<AlbumEntity, AlbumEntity, QAfterWhereClause> albumIdEqualTo(
    String albumId,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'albumId', value: [albumId]),
      );
    });
  }

  QueryBuilder<AlbumEntity, AlbumEntity, QAfterWhereClause> albumIdNotEqualTo(
    String albumId,
  ) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'albumId',
                lower: [],
                upper: [albumId],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'albumId',
                lower: [albumId],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'albumId',
                lower: [albumId],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'albumId',
                lower: [],
                upper: [albumId],
                includeUpper: false,
              ),
            );
      }
    });
  }
}

extension AlbumEntityQueryFilter
    on QueryBuilder<AlbumEntity, AlbumEntity, QFilterCondition> {
  QueryBuilder<AlbumEntity, AlbumEntity, QAfterFilterCondition> albumIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'albumId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AlbumEntity, AlbumEntity, QAfterFilterCondition>
  albumIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'albumId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AlbumEntity, AlbumEntity, QAfterFilterCondition> albumIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'albumId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AlbumEntity, AlbumEntity, QAfterFilterCondition> albumIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'albumId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AlbumEntity, AlbumEntity, QAfterFilterCondition>
  albumIdStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'albumId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AlbumEntity, AlbumEntity, QAfterFilterCondition> albumIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'albumId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AlbumEntity, AlbumEntity, QAfterFilterCondition> albumIdContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'albumId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AlbumEntity, AlbumEntity, QAfterFilterCondition> albumIdMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'albumId',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AlbumEntity, AlbumEntity, QAfterFilterCondition>
  albumIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'albumId', value: ''),
      );
    });
  }

  QueryBuilder<AlbumEntity, AlbumEntity, QAfterFilterCondition>
  albumIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'albumId', value: ''),
      );
    });
  }

  QueryBuilder<AlbumEntity, AlbumEntity, QAfterFilterCondition>
  catalogHashIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'catalogHash'),
      );
    });
  }

  QueryBuilder<AlbumEntity, AlbumEntity, QAfterFilterCondition>
  catalogHashIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'catalogHash'),
      );
    });
  }

  QueryBuilder<AlbumEntity, AlbumEntity, QAfterFilterCondition>
  catalogHashEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'catalogHash',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AlbumEntity, AlbumEntity, QAfterFilterCondition>
  catalogHashGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'catalogHash',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AlbumEntity, AlbumEntity, QAfterFilterCondition>
  catalogHashLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'catalogHash',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AlbumEntity, AlbumEntity, QAfterFilterCondition>
  catalogHashBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'catalogHash',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AlbumEntity, AlbumEntity, QAfterFilterCondition>
  catalogHashStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'catalogHash',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AlbumEntity, AlbumEntity, QAfterFilterCondition>
  catalogHashEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'catalogHash',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AlbumEntity, AlbumEntity, QAfterFilterCondition>
  catalogHashContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'catalogHash',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AlbumEntity, AlbumEntity, QAfterFilterCondition>
  catalogHashMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'catalogHash',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AlbumEntity, AlbumEntity, QAfterFilterCondition>
  catalogHashIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'catalogHash', value: ''),
      );
    });
  }

  QueryBuilder<AlbumEntity, AlbumEntity, QAfterFilterCondition>
  catalogHashIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'catalogHash', value: ''),
      );
    });
  }

  QueryBuilder<AlbumEntity, AlbumEntity, QAfterFilterCondition>
  catalogVersionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'catalogVersion'),
      );
    });
  }

  QueryBuilder<AlbumEntity, AlbumEntity, QAfterFilterCondition>
  catalogVersionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'catalogVersion'),
      );
    });
  }

  QueryBuilder<AlbumEntity, AlbumEntity, QAfterFilterCondition>
  catalogVersionEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'catalogVersion', value: value),
      );
    });
  }

  QueryBuilder<AlbumEntity, AlbumEntity, QAfterFilterCondition>
  catalogVersionGreaterThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'catalogVersion',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<AlbumEntity, AlbumEntity, QAfterFilterCondition>
  catalogVersionLessThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'catalogVersion',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<AlbumEntity, AlbumEntity, QAfterFilterCondition>
  catalogVersionBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'catalogVersion',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<AlbumEntity, AlbumEntity, QAfterFilterCondition> editionEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'edition',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AlbumEntity, AlbumEntity, QAfterFilterCondition>
  editionGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'edition',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AlbumEntity, AlbumEntity, QAfterFilterCondition> editionLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'edition',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AlbumEntity, AlbumEntity, QAfterFilterCondition> editionBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'edition',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AlbumEntity, AlbumEntity, QAfterFilterCondition>
  editionStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'edition',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AlbumEntity, AlbumEntity, QAfterFilterCondition> editionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'edition',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AlbumEntity, AlbumEntity, QAfterFilterCondition> editionContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'edition',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AlbumEntity, AlbumEntity, QAfterFilterCondition> editionMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'edition',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AlbumEntity, AlbumEntity, QAfterFilterCondition>
  editionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'edition', value: ''),
      );
    });
  }

  QueryBuilder<AlbumEntity, AlbumEntity, QAfterFilterCondition>
  editionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'edition', value: ''),
      );
    });
  }

  QueryBuilder<AlbumEntity, AlbumEntity, QAfterFilterCondition> isarIdEqualTo(
    Id value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'isarId', value: value),
      );
    });
  }

  QueryBuilder<AlbumEntity, AlbumEntity, QAfterFilterCondition>
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

  QueryBuilder<AlbumEntity, AlbumEntity, QAfterFilterCondition> isarIdLessThan(
    Id value, {
    bool include = false,
  }) {
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

  QueryBuilder<AlbumEntity, AlbumEntity, QAfterFilterCondition> isarIdBetween(
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
}

extension AlbumEntityQueryObject
    on QueryBuilder<AlbumEntity, AlbumEntity, QFilterCondition> {}

extension AlbumEntityQueryLinks
    on QueryBuilder<AlbumEntity, AlbumEntity, QFilterCondition> {}

extension AlbumEntityQuerySortBy
    on QueryBuilder<AlbumEntity, AlbumEntity, QSortBy> {
  QueryBuilder<AlbumEntity, AlbumEntity, QAfterSortBy> sortByAlbumId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'albumId', Sort.asc);
    });
  }

  QueryBuilder<AlbumEntity, AlbumEntity, QAfterSortBy> sortByAlbumIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'albumId', Sort.desc);
    });
  }

  QueryBuilder<AlbumEntity, AlbumEntity, QAfterSortBy> sortByCatalogHash() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'catalogHash', Sort.asc);
    });
  }

  QueryBuilder<AlbumEntity, AlbumEntity, QAfterSortBy> sortByCatalogHashDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'catalogHash', Sort.desc);
    });
  }

  QueryBuilder<AlbumEntity, AlbumEntity, QAfterSortBy> sortByCatalogVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'catalogVersion', Sort.asc);
    });
  }

  QueryBuilder<AlbumEntity, AlbumEntity, QAfterSortBy>
  sortByCatalogVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'catalogVersion', Sort.desc);
    });
  }

  QueryBuilder<AlbumEntity, AlbumEntity, QAfterSortBy> sortByEdition() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'edition', Sort.asc);
    });
  }

  QueryBuilder<AlbumEntity, AlbumEntity, QAfterSortBy> sortByEditionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'edition', Sort.desc);
    });
  }
}

extension AlbumEntityQuerySortThenBy
    on QueryBuilder<AlbumEntity, AlbumEntity, QSortThenBy> {
  QueryBuilder<AlbumEntity, AlbumEntity, QAfterSortBy> thenByAlbumId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'albumId', Sort.asc);
    });
  }

  QueryBuilder<AlbumEntity, AlbumEntity, QAfterSortBy> thenByAlbumIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'albumId', Sort.desc);
    });
  }

  QueryBuilder<AlbumEntity, AlbumEntity, QAfterSortBy> thenByCatalogHash() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'catalogHash', Sort.asc);
    });
  }

  QueryBuilder<AlbumEntity, AlbumEntity, QAfterSortBy> thenByCatalogHashDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'catalogHash', Sort.desc);
    });
  }

  QueryBuilder<AlbumEntity, AlbumEntity, QAfterSortBy> thenByCatalogVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'catalogVersion', Sort.asc);
    });
  }

  QueryBuilder<AlbumEntity, AlbumEntity, QAfterSortBy>
  thenByCatalogVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'catalogVersion', Sort.desc);
    });
  }

  QueryBuilder<AlbumEntity, AlbumEntity, QAfterSortBy> thenByEdition() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'edition', Sort.asc);
    });
  }

  QueryBuilder<AlbumEntity, AlbumEntity, QAfterSortBy> thenByEditionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'edition', Sort.desc);
    });
  }

  QueryBuilder<AlbumEntity, AlbumEntity, QAfterSortBy> thenByIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.asc);
    });
  }

  QueryBuilder<AlbumEntity, AlbumEntity, QAfterSortBy> thenByIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.desc);
    });
  }
}

extension AlbumEntityQueryWhereDistinct
    on QueryBuilder<AlbumEntity, AlbumEntity, QDistinct> {
  QueryBuilder<AlbumEntity, AlbumEntity, QDistinct> distinctByAlbumId({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'albumId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AlbumEntity, AlbumEntity, QDistinct> distinctByCatalogHash({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'catalogHash', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AlbumEntity, AlbumEntity, QDistinct> distinctByCatalogVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'catalogVersion');
    });
  }

  QueryBuilder<AlbumEntity, AlbumEntity, QDistinct> distinctByEdition({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'edition', caseSensitive: caseSensitive);
    });
  }
}

extension AlbumEntityQueryProperty
    on QueryBuilder<AlbumEntity, AlbumEntity, QQueryProperty> {
  QueryBuilder<AlbumEntity, int, QQueryOperations> isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarId');
    });
  }

  QueryBuilder<AlbumEntity, String, QQueryOperations> albumIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'albumId');
    });
  }

  QueryBuilder<AlbumEntity, String?, QQueryOperations> catalogHashProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'catalogHash');
    });
  }

  QueryBuilder<AlbumEntity, int?, QQueryOperations> catalogVersionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'catalogVersion');
    });
  }

  QueryBuilder<AlbumEntity, String, QQueryOperations> editionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'edition');
    });
  }
}
