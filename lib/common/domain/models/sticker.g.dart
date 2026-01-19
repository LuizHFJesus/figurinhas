// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sticker.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetStickerCollection on Isar {
  IsarCollection<Sticker> get stickers => this.collection();
}

const StickerSchema = CollectionSchema(
  name: r'Sticker',
  id: 1934486934114473254,
  properties: {
    r'code': PropertySchema(id: 0, name: r'code', type: IsarType.string),
    r'isFoil': PropertySchema(id: 1, name: r'isFoil', type: IsarType.bool),
    r'isOwned': PropertySchema(id: 2, name: r'isOwned', type: IsarType.bool),
    r'isRepeated': PropertySchema(
      id: 3,
      name: r'isRepeated',
      type: IsarType.bool,
    ),
    r'name': PropertySchema(id: 4, name: r'name', type: IsarType.string),
    r'quantity': PropertySchema(id: 5, name: r'quantity', type: IsarType.long),
    r'updatedAt': PropertySchema(
      id: 6,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
  },

  estimateSize: _stickerEstimateSize,
  serialize: _stickerSerialize,
  deserialize: _stickerDeserialize,
  deserializeProp: _stickerDeserializeProp,
  idName: r'isarId',
  indexes: {
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
    r'name': IndexSchema(
      id: 879695947855722453,
      name: r'name',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'name',
          type: IndexType.hash,
          caseSensitive: true,
        ),
      ],
    ),
    r'isFoil': IndexSchema(
      id: -1946560186653813894,
      name: r'isFoil',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'isFoil',
          type: IndexType.value,
          caseSensitive: false,
        ),
      ],
    ),
    r'quantity': IndexSchema(
      id: 6562868945802959322,
      name: r'quantity',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'quantity',
          type: IndexType.value,
          caseSensitive: false,
        ),
      ],
    ),
    r'isOwned': IndexSchema(
      id: -8062236361993569491,
      name: r'isOwned',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'isOwned',
          type: IndexType.value,
          caseSensitive: false,
        ),
      ],
    ),
    r'isRepeated': IndexSchema(
      id: 8831025088410115136,
      name: r'isRepeated',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'isRepeated',
          type: IndexType.value,
          caseSensitive: false,
        ),
      ],
    ),
  },
  links: {
    r'section': LinkSchema(
      id: 499164542727174900,
      name: r'section',
      target: r'Section',
      single: true,
    ),
  },
  embeddedSchemas: {},

  getId: _stickerGetId,
  getLinks: _stickerGetLinks,
  attach: _stickerAttach,
  version: '3.3.0',
);

int _stickerEstimateSize(
  Sticker object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.code.length * 3;
  {
    final value = object.name;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _stickerSerialize(
  Sticker object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.code);
  writer.writeBool(offsets[1], object.isFoil);
  writer.writeBool(offsets[2], object.isOwned);
  writer.writeBool(offsets[3], object.isRepeated);
  writer.writeString(offsets[4], object.name);
  writer.writeLong(offsets[5], object.quantity);
  writer.writeDateTime(offsets[6], object.updatedAt);
}

Sticker _stickerDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Sticker();
  object.code = reader.readString(offsets[0]);
  object.isFoil = reader.readBool(offsets[1]);
  object.isOwned = reader.readBool(offsets[2]);
  object.isRepeated = reader.readBool(offsets[3]);
  object.isarId = id;
  object.name = reader.readStringOrNull(offsets[4]);
  object.quantity = reader.readLong(offsets[5]);
  object.updatedAt = reader.readDateTime(offsets[6]);
  return object;
}

P _stickerDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readBool(offset)) as P;
    case 2:
      return (reader.readBool(offset)) as P;
    case 3:
      return (reader.readBool(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readLong(offset)) as P;
    case 6:
      return (reader.readDateTime(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _stickerGetId(Sticker object) {
  return object.isarId;
}

List<IsarLinkBase<dynamic>> _stickerGetLinks(Sticker object) {
  return [object.section];
}

void _stickerAttach(IsarCollection<dynamic> col, Id id, Sticker object) {
  object.isarId = id;
  object.section.attach(col, col.isar.collection<Section>(), r'section', id);
}

extension StickerQueryWhereSort on QueryBuilder<Sticker, Sticker, QWhere> {
  QueryBuilder<Sticker, Sticker, QAfterWhere> anyIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<Sticker, Sticker, QAfterWhere> anyIsFoil() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'isFoil'),
      );
    });
  }

  QueryBuilder<Sticker, Sticker, QAfterWhere> anyQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'quantity'),
      );
    });
  }

  QueryBuilder<Sticker, Sticker, QAfterWhere> anyIsOwned() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'isOwned'),
      );
    });
  }

  QueryBuilder<Sticker, Sticker, QAfterWhere> anyIsRepeated() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'isRepeated'),
      );
    });
  }
}

extension StickerQueryWhere on QueryBuilder<Sticker, Sticker, QWhereClause> {
  QueryBuilder<Sticker, Sticker, QAfterWhereClause> isarIdEqualTo(Id isarId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.between(lower: isarId, upper: isarId),
      );
    });
  }

  QueryBuilder<Sticker, Sticker, QAfterWhereClause> isarIdNotEqualTo(
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

  QueryBuilder<Sticker, Sticker, QAfterWhereClause> isarIdGreaterThan(
    Id isarId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarId, includeLower: include),
      );
    });
  }

  QueryBuilder<Sticker, Sticker, QAfterWhereClause> isarIdLessThan(
    Id isarId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarId, includeUpper: include),
      );
    });
  }

  QueryBuilder<Sticker, Sticker, QAfterWhereClause> isarIdBetween(
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

  QueryBuilder<Sticker, Sticker, QAfterWhereClause> codeEqualTo(String code) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'code', value: [code]),
      );
    });
  }

  QueryBuilder<Sticker, Sticker, QAfterWhereClause> codeNotEqualTo(
    String code,
  ) {
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

  QueryBuilder<Sticker, Sticker, QAfterWhereClause> nameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'name', value: [null]),
      );
    });
  }

  QueryBuilder<Sticker, Sticker, QAfterWhereClause> nameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'name',
          lower: [null],
          includeLower: false,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<Sticker, Sticker, QAfterWhereClause> nameEqualTo(String? name) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'name', value: [name]),
      );
    });
  }

  QueryBuilder<Sticker, Sticker, QAfterWhereClause> nameNotEqualTo(
    String? name,
  ) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'name',
                lower: [],
                upper: [name],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'name',
                lower: [name],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'name',
                lower: [name],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'name',
                lower: [],
                upper: [name],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<Sticker, Sticker, QAfterWhereClause> isFoilEqualTo(bool isFoil) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'isFoil', value: [isFoil]),
      );
    });
  }

  QueryBuilder<Sticker, Sticker, QAfterWhereClause> isFoilNotEqualTo(
    bool isFoil,
  ) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'isFoil',
                lower: [],
                upper: [isFoil],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'isFoil',
                lower: [isFoil],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'isFoil',
                lower: [isFoil],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'isFoil',
                lower: [],
                upper: [isFoil],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<Sticker, Sticker, QAfterWhereClause> quantityEqualTo(
    int quantity,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'quantity', value: [quantity]),
      );
    });
  }

  QueryBuilder<Sticker, Sticker, QAfterWhereClause> quantityNotEqualTo(
    int quantity,
  ) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'quantity',
                lower: [],
                upper: [quantity],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'quantity',
                lower: [quantity],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'quantity',
                lower: [quantity],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'quantity',
                lower: [],
                upper: [quantity],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<Sticker, Sticker, QAfterWhereClause> quantityGreaterThan(
    int quantity, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'quantity',
          lower: [quantity],
          includeLower: include,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<Sticker, Sticker, QAfterWhereClause> quantityLessThan(
    int quantity, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'quantity',
          lower: [],
          upper: [quantity],
          includeUpper: include,
        ),
      );
    });
  }

  QueryBuilder<Sticker, Sticker, QAfterWhereClause> quantityBetween(
    int lowerQuantity,
    int upperQuantity, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'quantity',
          lower: [lowerQuantity],
          includeLower: includeLower,
          upper: [upperQuantity],
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<Sticker, Sticker, QAfterWhereClause> isOwnedEqualTo(
    bool isOwned,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'isOwned', value: [isOwned]),
      );
    });
  }

  QueryBuilder<Sticker, Sticker, QAfterWhereClause> isOwnedNotEqualTo(
    bool isOwned,
  ) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'isOwned',
                lower: [],
                upper: [isOwned],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'isOwned',
                lower: [isOwned],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'isOwned',
                lower: [isOwned],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'isOwned',
                lower: [],
                upper: [isOwned],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<Sticker, Sticker, QAfterWhereClause> isRepeatedEqualTo(
    bool isRepeated,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'isRepeated', value: [isRepeated]),
      );
    });
  }

  QueryBuilder<Sticker, Sticker, QAfterWhereClause> isRepeatedNotEqualTo(
    bool isRepeated,
  ) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'isRepeated',
                lower: [],
                upper: [isRepeated],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'isRepeated',
                lower: [isRepeated],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'isRepeated',
                lower: [isRepeated],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'isRepeated',
                lower: [],
                upper: [isRepeated],
                includeUpper: false,
              ),
            );
      }
    });
  }
}

extension StickerQueryFilter
    on QueryBuilder<Sticker, Sticker, QFilterCondition> {
  QueryBuilder<Sticker, Sticker, QAfterFilterCondition> codeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
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

  QueryBuilder<Sticker, Sticker, QAfterFilterCondition> codeGreaterThan(
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

  QueryBuilder<Sticker, Sticker, QAfterFilterCondition> codeLessThan(
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

  QueryBuilder<Sticker, Sticker, QAfterFilterCondition> codeBetween(
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

  QueryBuilder<Sticker, Sticker, QAfterFilterCondition> codeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
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

  QueryBuilder<Sticker, Sticker, QAfterFilterCondition> codeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
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

  QueryBuilder<Sticker, Sticker, QAfterFilterCondition> codeContains(
    String value, {
    bool caseSensitive = true,
  }) {
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

  QueryBuilder<Sticker, Sticker, QAfterFilterCondition> codeMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
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

  QueryBuilder<Sticker, Sticker, QAfterFilterCondition> codeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'code', value: ''),
      );
    });
  }

  QueryBuilder<Sticker, Sticker, QAfterFilterCondition> codeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'code', value: ''),
      );
    });
  }

  QueryBuilder<Sticker, Sticker, QAfterFilterCondition> isFoilEqualTo(
    bool value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'isFoil', value: value),
      );
    });
  }

  QueryBuilder<Sticker, Sticker, QAfterFilterCondition> isOwnedEqualTo(
    bool value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'isOwned', value: value),
      );
    });
  }

  QueryBuilder<Sticker, Sticker, QAfterFilterCondition> isRepeatedEqualTo(
    bool value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'isRepeated', value: value),
      );
    });
  }

  QueryBuilder<Sticker, Sticker, QAfterFilterCondition> isarIdEqualTo(
    Id value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'isarId', value: value),
      );
    });
  }

  QueryBuilder<Sticker, Sticker, QAfterFilterCondition> isarIdGreaterThan(
    Id value, {
    bool include = false,
  }) {
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

  QueryBuilder<Sticker, Sticker, QAfterFilterCondition> isarIdLessThan(
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

  QueryBuilder<Sticker, Sticker, QAfterFilterCondition> isarIdBetween(
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

  QueryBuilder<Sticker, Sticker, QAfterFilterCondition> nameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'name'),
      );
    });
  }

  QueryBuilder<Sticker, Sticker, QAfterFilterCondition> nameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'name'),
      );
    });
  }

  QueryBuilder<Sticker, Sticker, QAfterFilterCondition> nameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Sticker, Sticker, QAfterFilterCondition> nameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Sticker, Sticker, QAfterFilterCondition> nameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Sticker, Sticker, QAfterFilterCondition> nameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'name',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Sticker, Sticker, QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Sticker, Sticker, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Sticker, Sticker, QAfterFilterCondition> nameContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Sticker, Sticker, QAfterFilterCondition> nameMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'name',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Sticker, Sticker, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'name', value: ''),
      );
    });
  }

  QueryBuilder<Sticker, Sticker, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'name', value: ''),
      );
    });
  }

  QueryBuilder<Sticker, Sticker, QAfterFilterCondition> quantityEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'quantity', value: value),
      );
    });
  }

  QueryBuilder<Sticker, Sticker, QAfterFilterCondition> quantityGreaterThan(
    int value, {
    bool include = false,
  }) {
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

  QueryBuilder<Sticker, Sticker, QAfterFilterCondition> quantityLessThan(
    int value, {
    bool include = false,
  }) {
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

  QueryBuilder<Sticker, Sticker, QAfterFilterCondition> quantityBetween(
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

  QueryBuilder<Sticker, Sticker, QAfterFilterCondition> updatedAtEqualTo(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'updatedAt', value: value),
      );
    });
  }

  QueryBuilder<Sticker, Sticker, QAfterFilterCondition> updatedAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
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

  QueryBuilder<Sticker, Sticker, QAfterFilterCondition> updatedAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
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

  QueryBuilder<Sticker, Sticker, QAfterFilterCondition> updatedAtBetween(
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

extension StickerQueryObject
    on QueryBuilder<Sticker, Sticker, QFilterCondition> {}

extension StickerQueryLinks
    on QueryBuilder<Sticker, Sticker, QFilterCondition> {
  QueryBuilder<Sticker, Sticker, QAfterFilterCondition> section(
    FilterQuery<Section> q,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'section');
    });
  }

  QueryBuilder<Sticker, Sticker, QAfterFilterCondition> sectionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'section', 0, true, 0, true);
    });
  }
}

extension StickerQuerySortBy on QueryBuilder<Sticker, Sticker, QSortBy> {
  QueryBuilder<Sticker, Sticker, QAfterSortBy> sortByCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'code', Sort.asc);
    });
  }

  QueryBuilder<Sticker, Sticker, QAfterSortBy> sortByCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'code', Sort.desc);
    });
  }

  QueryBuilder<Sticker, Sticker, QAfterSortBy> sortByIsFoil() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFoil', Sort.asc);
    });
  }

  QueryBuilder<Sticker, Sticker, QAfterSortBy> sortByIsFoilDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFoil', Sort.desc);
    });
  }

  QueryBuilder<Sticker, Sticker, QAfterSortBy> sortByIsOwned() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isOwned', Sort.asc);
    });
  }

  QueryBuilder<Sticker, Sticker, QAfterSortBy> sortByIsOwnedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isOwned', Sort.desc);
    });
  }

  QueryBuilder<Sticker, Sticker, QAfterSortBy> sortByIsRepeated() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isRepeated', Sort.asc);
    });
  }

  QueryBuilder<Sticker, Sticker, QAfterSortBy> sortByIsRepeatedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isRepeated', Sort.desc);
    });
  }

  QueryBuilder<Sticker, Sticker, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Sticker, Sticker, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<Sticker, Sticker, QAfterSortBy> sortByQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity', Sort.asc);
    });
  }

  QueryBuilder<Sticker, Sticker, QAfterSortBy> sortByQuantityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity', Sort.desc);
    });
  }

  QueryBuilder<Sticker, Sticker, QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<Sticker, Sticker, QAfterSortBy> sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension StickerQuerySortThenBy
    on QueryBuilder<Sticker, Sticker, QSortThenBy> {
  QueryBuilder<Sticker, Sticker, QAfterSortBy> thenByCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'code', Sort.asc);
    });
  }

  QueryBuilder<Sticker, Sticker, QAfterSortBy> thenByCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'code', Sort.desc);
    });
  }

  QueryBuilder<Sticker, Sticker, QAfterSortBy> thenByIsFoil() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFoil', Sort.asc);
    });
  }

  QueryBuilder<Sticker, Sticker, QAfterSortBy> thenByIsFoilDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFoil', Sort.desc);
    });
  }

  QueryBuilder<Sticker, Sticker, QAfterSortBy> thenByIsOwned() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isOwned', Sort.asc);
    });
  }

  QueryBuilder<Sticker, Sticker, QAfterSortBy> thenByIsOwnedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isOwned', Sort.desc);
    });
  }

  QueryBuilder<Sticker, Sticker, QAfterSortBy> thenByIsRepeated() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isRepeated', Sort.asc);
    });
  }

  QueryBuilder<Sticker, Sticker, QAfterSortBy> thenByIsRepeatedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isRepeated', Sort.desc);
    });
  }

  QueryBuilder<Sticker, Sticker, QAfterSortBy> thenByIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.asc);
    });
  }

  QueryBuilder<Sticker, Sticker, QAfterSortBy> thenByIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.desc);
    });
  }

  QueryBuilder<Sticker, Sticker, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Sticker, Sticker, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<Sticker, Sticker, QAfterSortBy> thenByQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity', Sort.asc);
    });
  }

  QueryBuilder<Sticker, Sticker, QAfterSortBy> thenByQuantityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity', Sort.desc);
    });
  }

  QueryBuilder<Sticker, Sticker, QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<Sticker, Sticker, QAfterSortBy> thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension StickerQueryWhereDistinct
    on QueryBuilder<Sticker, Sticker, QDistinct> {
  QueryBuilder<Sticker, Sticker, QDistinct> distinctByCode({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'code', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Sticker, Sticker, QDistinct> distinctByIsFoil() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isFoil');
    });
  }

  QueryBuilder<Sticker, Sticker, QDistinct> distinctByIsOwned() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isOwned');
    });
  }

  QueryBuilder<Sticker, Sticker, QDistinct> distinctByIsRepeated() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isRepeated');
    });
  }

  QueryBuilder<Sticker, Sticker, QDistinct> distinctByName({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Sticker, Sticker, QDistinct> distinctByQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'quantity');
    });
  }

  QueryBuilder<Sticker, Sticker, QDistinct> distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }
}

extension StickerQueryProperty
    on QueryBuilder<Sticker, Sticker, QQueryProperty> {
  QueryBuilder<Sticker, int, QQueryOperations> isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarId');
    });
  }

  QueryBuilder<Sticker, String, QQueryOperations> codeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'code');
    });
  }

  QueryBuilder<Sticker, bool, QQueryOperations> isFoilProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isFoil');
    });
  }

  QueryBuilder<Sticker, bool, QQueryOperations> isOwnedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isOwned');
    });
  }

  QueryBuilder<Sticker, bool, QQueryOperations> isRepeatedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isRepeated');
    });
  }

  QueryBuilder<Sticker, String?, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<Sticker, int, QQueryOperations> quantityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'quantity');
    });
  }

  QueryBuilder<Sticker, DateTime, QQueryOperations> updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }
}
