// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee_model_List.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class employeemodelListAdapter extends TypeAdapter<employee_model_List> {
  @override
  final int typeId = 3;

  @override
  employee_model_List read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return employee_model_List()..empList = (fields[0] as List?)?.cast<EmployeeModel>();
  }

  @override
  void write(BinaryWriter writer, employee_model_List obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.empList);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) => identical(this, other) || other is employeemodelListAdapter && runtimeType == other.runtimeType && typeId == other.typeId;
}
