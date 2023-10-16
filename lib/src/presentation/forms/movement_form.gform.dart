// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file:

part of 'movement_form.dart';

// **************************************************************************
// ReactiveFormsGenerator
// **************************************************************************

class ReactiveMovementFormEntityFormConsumer extends StatelessWidget {
  const ReactiveMovementFormEntityFormConsumer({
    Key? key,
    required this.builder,
    this.child,
  }) : super(key: key);

  final Widget? child;

  final Widget Function(
          BuildContext context, MovementFormEntityForm formModel, Widget? child)
      builder;

  @override
  Widget build(BuildContext context) {
    final formModel = ReactiveMovementFormEntityForm.of(context);

    if (formModel is! MovementFormEntityForm) {
      throw FormControlParentNotFoundException(this);
    }
    return builder(context, formModel, child);
  }
}

class MovementFormEntityFormInheritedStreamer
    extends InheritedStreamer<dynamic> {
  const MovementFormEntityFormInheritedStreamer({
    Key? key,
    required this.form,
    required Stream<dynamic> stream,
    required Widget child,
  }) : super(
          stream,
          child,
          key: key,
        );

  final MovementFormEntityForm form;
}

class ReactiveMovementFormEntityForm extends StatelessWidget {
  const ReactiveMovementFormEntityForm({
    Key? key,
    required this.form,
    required this.child,
    this.onWillPop,
  }) : super(key: key);

  final Widget child;

  final MovementFormEntityForm form;

  final WillPopCallback? onWillPop;

  static MovementFormEntityForm? of(
    BuildContext context, {
    bool listen = true,
  }) {
    if (listen) {
      return context
          .dependOnInheritedWidgetOfExactType<
              MovementFormEntityFormInheritedStreamer>()
          ?.form;
    }

    final element = context.getElementForInheritedWidgetOfExactType<
        MovementFormEntityFormInheritedStreamer>();
    return element == null
        ? null
        : (element.widget as MovementFormEntityFormInheritedStreamer).form;
  }

  @override
  Widget build(BuildContext context) {
    return MovementFormEntityFormInheritedStreamer(
      form: form,
      stream: form.form.statusChanged,
      child: WillPopScope(
        onWillPop: onWillPop,
        child: child,
      ),
    );
  }
}

class MovementFormEntityFormBuilder extends StatefulWidget {
  const MovementFormEntityFormBuilder({
    Key? key,
    this.model,
    this.child,
    this.onWillPop,
    required this.builder,
    this.initState,
  }) : super(key: key);

  final MovementFormEntity? model;

  final Widget? child;

  final WillPopCallback? onWillPop;

  final Widget Function(
          BuildContext context, MovementFormEntityForm formModel, Widget? child)
      builder;

  final void Function(BuildContext context, MovementFormEntityForm formModel)?
      initState;

  @override
  _MovementFormEntityFormBuilderState createState() =>
      _MovementFormEntityFormBuilderState();
}

class _MovementFormEntityFormBuilderState
    extends State<MovementFormEntityFormBuilder> {
  late MovementFormEntityForm _formModel;

  @override
  void initState() {
    _formModel = MovementFormEntityForm(
        MovementFormEntityForm.formElements(widget.model), null);

    if (_formModel.form.disabled) {
      _formModel.form.markAsDisabled();
    }

    widget.initState?.call(context, _formModel);

    super.initState();
  }

  @override
  void didUpdateWidget(covariant MovementFormEntityFormBuilder oldWidget) {
    if (widget.model != oldWidget.model) {
      _formModel = MovementFormEntityForm(
          MovementFormEntityForm.formElements(widget.model), null);

      if (_formModel.form.disabled) {
        _formModel.form.markAsDisabled();
      }

      widget.initState?.call(context, _formModel);
    }

    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _formModel.form.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ReactiveMovementFormEntityForm(
      key: ObjectKey(_formModel),
      form: _formModel,
      onWillPop: widget.onWillPop,
      child: ReactiveFormBuilder(
        form: () => _formModel.form,
        onWillPop: widget.onWillPop,
        builder: (context, formGroup, child) =>
            widget.builder(context, _formModel, widget.child),
        child: widget.child,
      ),
    );
  }
}

class MovementFormEntityForm implements FormModel<MovementFormEntity> {
  MovementFormEntityForm(
    this.form,
    this.path,
  );

  static const String idControlName = "id";

  static const String entityControlName = "entity";

  static const String costCenterControlName = "costCenter";

  static const String descriptionControlName = "description";

  static const String nameControlName = "name";

  static const String roleControlName = "role";

  static const String idMedioControlName = "idMedio";

  static const String typeControlName = "type";

  static const String subclassificationControlName = "subclassification";

  static const String areaControlName = "area";

  final FormGroup form;

  final String? path;

  String idControlPath() => pathBuilder(idControlName);

  String entityControlPath() => pathBuilder(entityControlName);

  String costCenterControlPath() => pathBuilder(costCenterControlName);

  String descriptionControlPath() => pathBuilder(descriptionControlName);

  String nameControlPath() => pathBuilder(nameControlName);

  String roleControlPath() => pathBuilder(roleControlName);

  String idMedioControlPath() => pathBuilder(idMedioControlName);

  String typeControlPath() => pathBuilder(typeControlName);

  String subclassificationControlPath() =>
      pathBuilder(subclassificationControlName);

  String areaControlPath() => pathBuilder(areaControlName);

  String get _idValue => idControl.value ?? "";

  String get _entityValue => entityControl.value ?? "";

  String get _costCenterValue => costCenterControl.value ?? "";

  String get _descriptionValue => descriptionControl.value ?? "";

  String get _nameValue => nameControl.value ?? "";

  String get _roleValue => roleControl.value ?? "";

  String get _idMedioValue => idMedioControl.value ?? "";

  String get _typeValue => typeControl.value ?? "";

  String get _subclassificationValue => subclassificationControl.value ?? "";

  String get _areaValue => areaControl.value ?? "";

  bool get containsId {
    try {
      form.control(idControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  bool get containsEntity {
    try {
      form.control(entityControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  bool get containsCostCenter {
    try {
      form.control(costCenterControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  bool get containsDescription {
    try {
      form.control(descriptionControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  bool get containsName {
    try {
      form.control(nameControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  bool get containsRole {
    try {
      form.control(roleControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  bool get containsIdMedio {
    try {
      form.control(idMedioControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  bool get containsType {
    try {
      form.control(typeControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  bool get containsSubclassification {
    try {
      form.control(subclassificationControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  bool get containsArea {
    try {
      form.control(areaControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  Object? get idErrors => idControl.errors;

  Object? get entityErrors => entityControl.errors;

  Object? get costCenterErrors => costCenterControl.errors;

  Object? get descriptionErrors => descriptionControl.errors;

  Object? get nameErrors => nameControl.errors;

  Object? get roleErrors => roleControl.errors;

  Object? get idMedioErrors => idMedioControl.errors;

  Object? get typeErrors => typeControl.errors;

  Object? get subclassificationErrors => subclassificationControl.errors;

  Object? get areaErrors => areaControl.errors;

  void get idFocus => form.focus(idControlPath());

  void get entityFocus => form.focus(entityControlPath());

  void get costCenterFocus => form.focus(costCenterControlPath());

  void get descriptionFocus => form.focus(descriptionControlPath());

  void get nameFocus => form.focus(nameControlPath());

  void get roleFocus => form.focus(roleControlPath());

  void get idMedioFocus => form.focus(idMedioControlPath());

  void get typeFocus => form.focus(typeControlPath());

  void get subclassificationFocus => form.focus(subclassificationControlPath());

  void get areaFocus => form.focus(areaControlPath());

  void idValueUpdate(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    idControl.updateValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void entityValueUpdate(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    entityControl.updateValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void costCenterValueUpdate(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    costCenterControl.updateValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void descriptionValueUpdate(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    descriptionControl.updateValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void nameValueUpdate(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    nameControl.updateValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void roleValueUpdate(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    roleControl.updateValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void idMedioValueUpdate(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    idMedioControl.updateValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void typeValueUpdate(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    typeControl.updateValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void subclassificationValueUpdate(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    subclassificationControl.updateValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void areaValueUpdate(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    areaControl.updateValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void idValuePatch(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    idControl.patchValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void entityValuePatch(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    entityControl.patchValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void costCenterValuePatch(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    costCenterControl.patchValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void descriptionValuePatch(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    descriptionControl.patchValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void nameValuePatch(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    nameControl.patchValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void roleValuePatch(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    roleControl.patchValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void idMedioValuePatch(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    idMedioControl.patchValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void typeValuePatch(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    typeControl.patchValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void subclassificationValuePatch(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    subclassificationControl.patchValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void areaValuePatch(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    areaControl.patchValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void idValueReset(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      idControl.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);

  void entityValueReset(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      entityControl.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);

  void costCenterValueReset(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      costCenterControl.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);

  void descriptionValueReset(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      descriptionControl.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);

  void nameValueReset(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      nameControl.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);

  void roleValueReset(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      roleControl.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);

  void idMedioValueReset(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      idMedioControl.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);

  void typeValueReset(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      typeControl.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);

  void subclassificationValueReset(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      subclassificationControl.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);

  void areaValueReset(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      areaControl.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);

  FormControl<String> get idControl =>
      form.control(idControlPath()) as FormControl<String>;

  FormControl<String> get entityControl =>
      form.control(entityControlPath()) as FormControl<String>;

  FormControl<String> get costCenterControl =>
      form.control(costCenterControlPath()) as FormControl<String>;

  FormControl<String> get descriptionControl =>
      form.control(descriptionControlPath()) as FormControl<String>;

  FormControl<String> get nameControl =>
      form.control(nameControlPath()) as FormControl<String>;

  FormControl<String> get roleControl =>
      form.control(roleControlPath()) as FormControl<String>;

  FormControl<String> get idMedioControl =>
      form.control(idMedioControlPath()) as FormControl<String>;

  FormControl<String> get typeControl =>
      form.control(typeControlPath()) as FormControl<String>;

  FormControl<String> get subclassificationControl =>
      form.control(subclassificationControlPath()) as FormControl<String>;

  FormControl<String> get areaControl =>
      form.control(areaControlPath()) as FormControl<String>;

  void idSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      idControl.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      idControl.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  void entitySetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      entityControl.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      entityControl.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  void costCenterSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      costCenterControl.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      costCenterControl.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  void descriptionSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      descriptionControl.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      descriptionControl.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  void nameSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      nameControl.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      nameControl.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  void roleSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      roleControl.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      roleControl.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  void idMedioSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      idMedioControl.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      idMedioControl.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  void typeSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      typeControl.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      typeControl.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  void subclassificationSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      subclassificationControl.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      subclassificationControl.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  void areaSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      areaControl.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      areaControl.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  @override
  MovementFormEntity get model {
    final currentForm = path == null ? form : form.control(path!);

    if (!currentForm.valid) {
      debugPrint(
          '[${path ?? 'MovementFormEntityForm'}]\n┗━ Avoid calling `model` on invalid form. Possible exceptions for non-nullable fields which should be guarded by `required` validator.');
    }
    return MovementFormEntity(
        id: _idValue,
        entity: _entityValue,
        costCenter: _costCenterValue,
        description: _descriptionValue,
        name: _nameValue,
        role: _roleValue,
        idMedio: _idMedioValue,
        type: _typeValue,
        subclassification: _subclassificationValue,
        area: _areaValue);
  }

  @override
  void submit({
    required void Function(MovementFormEntity model) onValid,
    void Function()? onNotValid,
  }) {
    form.markAllAsTouched();
    if (form.valid) {
      onValid(model);
    } else {
      onNotValid?.call();
    }
  }

  @override
  void updateValue(
    MovementFormEntity value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) =>
      form.updateValue(MovementFormEntityForm.formElements(value).rawValue,
          updateParent: updateParent, emitEvent: emitEvent);

  @override
  void reset({
    MovementFormEntity? value,
    bool updateParent = true,
    bool emitEvent = true,
  }) =>
      form.reset(
          value: value != null ? formElements(value).rawValue : null,
          updateParent: updateParent,
          emitEvent: emitEvent);

  String pathBuilder(String? pathItem) =>
      [path, pathItem].whereType<String>().join(".");

  static FormGroup formElements(MovementFormEntity? movementFormEntity) =>
      FormGroup({
        idControlName: FormControl<String>(
            value: movementFormEntity?.id,
            validators: [RequiredValidator()],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false),
        entityControlName: FormControl<String>(
            value: movementFormEntity?.entity,
            validators: [RequiredValidator()],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false),
        costCenterControlName: FormControl<String>(
            value: movementFormEntity?.costCenter,
            validators: [RequiredValidator()],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false),
        descriptionControlName: FormControl<String>(
            value: movementFormEntity?.description,
            validators: [RequiredValidator()],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false),
        nameControlName: FormControl<String>(
            value: movementFormEntity?.name,
            validators: [RequiredValidator()],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false),
        roleControlName: FormControl<String>(
            value: movementFormEntity?.role,
            validators: [RequiredValidator()],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false),
        idMedioControlName: FormControl<String>(
            value: movementFormEntity?.idMedio,
            validators: [RequiredValidator()],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false),
        typeControlName: FormControl<String>(
            value: movementFormEntity?.type,
            validators: [RequiredValidator()],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false),
        subclassificationControlName: FormControl<String>(
            value: movementFormEntity?.subclassification,
            validators: [RequiredValidator()],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false),
        areaControlName: FormControl<String>(
            value: movementFormEntity?.area,
            validators: [RequiredValidator()],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false)
      },
          validators: [],
          asyncValidators: [],
          asyncValidatorsDebounceTime: 250,
          disabled: false);
}

class ReactiveMovementFormEntityFormArrayBuilder<T> extends StatelessWidget {
  const ReactiveMovementFormEntityFormArrayBuilder({
    Key? key,
    this.control,
    this.formControl,
    this.builder,
    required this.itemBuilder,
  })  : assert(control != null || formControl != null,
            "You have to specify `control` or `formControl`!"),
        super(key: key);

  final FormArray<T>? formControl;

  final FormArray<T>? Function(MovementFormEntityForm formModel)? control;

  final Widget Function(BuildContext context, List<Widget> itemList,
      MovementFormEntityForm formModel)? builder;

  final Widget Function(BuildContext context, int i, T? item,
      MovementFormEntityForm formModel) itemBuilder;

  @override
  Widget build(BuildContext context) {
    final formModel = ReactiveMovementFormEntityForm.of(context);

    if (formModel == null) {
      throw FormControlParentNotFoundException(this);
    }

    return ReactiveFormArray<T>(
      formArray: formControl ?? control?.call(formModel),
      builder: (context, formArray, child) {
        final itemList = (formArray.value ?? [])
            .asMap()
            .map((i, item) {
              return MapEntry(
                i,
                itemBuilder(
                  context,
                  i,
                  item,
                  formModel,
                ),
              );
            })
            .values
            .toList();

        return builder?.call(
              context,
              itemList,
              formModel,
            ) ??
            Column(children: itemList);
      },
    );
  }
}

class ReactiveMovementFormEntityFormFormGroupArrayBuilder<T>
    extends StatelessWidget {
  const ReactiveMovementFormEntityFormFormGroupArrayBuilder({
    Key? key,
    this.extended,
    this.getExtended,
    this.builder,
    required this.itemBuilder,
  })  : assert(extended != null || getExtended != null,
            "You have to specify `control` or `formControl`!"),
        super(key: key);

  final ExtendedControl<List<Map<String, Object?>?>, List<T>>? extended;

  final ExtendedControl<List<Map<String, Object?>?>, List<T>> Function(
      MovementFormEntityForm formModel)? getExtended;

  final Widget Function(BuildContext context, List<Widget> itemList,
      MovementFormEntityForm formModel)? builder;

  final Widget Function(BuildContext context, int i, T? item,
      MovementFormEntityForm formModel) itemBuilder;

  @override
  Widget build(BuildContext context) {
    final formModel = ReactiveMovementFormEntityForm.of(context);

    if (formModel == null) {
      throw FormControlParentNotFoundException(this);
    }

    final value = (extended ?? getExtended?.call(formModel))!;

    return StreamBuilder<List<Map<String, Object?>?>?>(
      stream: value.control.valueChanges,
      builder: (context, snapshot) {
        final itemList = (value.value() ?? <T>[])
            .asMap()
            .map((i, item) => MapEntry(
                  i,
                  itemBuilder(
                    context,
                    i,
                    item,
                    formModel,
                  ),
                ))
            .values
            .toList();

        return builder?.call(
              context,
              itemList,
              formModel,
            ) ??
            Column(children: itemList);
      },
    );
  }
}
