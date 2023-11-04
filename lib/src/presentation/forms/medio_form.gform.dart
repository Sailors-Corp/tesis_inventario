// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file:

part of 'medio_form.dart';

// **************************************************************************
// ReactiveFormsGenerator
// **************************************************************************

class ReactiveMedioFormEntityFormConsumer extends StatelessWidget {
  const ReactiveMedioFormEntityFormConsumer({
    Key? key,
    required this.builder,
    this.child,
  }) : super(key: key);

  final Widget? child;

  final Widget Function(
          BuildContext context, MedioFormEntityForm formModel, Widget? child)
      builder;

  @override
  Widget build(BuildContext context) {
    final formModel = ReactiveMedioFormEntityForm.of(context);

    if (formModel is! MedioFormEntityForm) {
      throw FormControlParentNotFoundException(this);
    }
    return builder(context, formModel, child);
  }
}

class MedioFormEntityFormInheritedStreamer extends InheritedStreamer<dynamic> {
  const MedioFormEntityFormInheritedStreamer({
    Key? key,
    required this.form,
    required Stream<dynamic> stream,
    required Widget child,
  }) : super(
          stream,
          child,
          key: key,
        );

  final MedioFormEntityForm form;
}

class ReactiveMedioFormEntityForm extends StatelessWidget {
  const ReactiveMedioFormEntityForm({
    Key? key,
    required this.form,
    required this.child,
    this.onWillPop,
  }) : super(key: key);

  final Widget child;

  final MedioFormEntityForm form;

  final WillPopCallback? onWillPop;

  static MedioFormEntityForm? of(
    BuildContext context, {
    bool listen = true,
  }) {
    if (listen) {
      return context
          .dependOnInheritedWidgetOfExactType<
              MedioFormEntityFormInheritedStreamer>()
          ?.form;
    }

    final element = context.getElementForInheritedWidgetOfExactType<
        MedioFormEntityFormInheritedStreamer>();
    return element == null
        ? null
        : (element.widget as MedioFormEntityFormInheritedStreamer).form;
  }

  @override
  Widget build(BuildContext context) {
    return MedioFormEntityFormInheritedStreamer(
      form: form,
      stream: form.form.statusChanged,
      child: WillPopScope(
        onWillPop: onWillPop,
        child: child,
      ),
    );
  }
}

class MedioFormEntityFormBuilder extends StatefulWidget {
  const MedioFormEntityFormBuilder({
    Key? key,
    this.model,
    this.child,
    this.onWillPop,
    required this.builder,
    this.initState,
  }) : super(key: key);

  final MedioFormEntity? model;

  final Widget? child;

  final WillPopCallback? onWillPop;

  final Widget Function(
          BuildContext context, MedioFormEntityForm formModel, Widget? child)
      builder;

  final void Function(BuildContext context, MedioFormEntityForm formModel)?
      initState;

  @override
  _MedioFormEntityFormBuilderState createState() =>
      _MedioFormEntityFormBuilderState();
}

class _MedioFormEntityFormBuilderState
    extends State<MedioFormEntityFormBuilder> {
  late MedioFormEntityForm _formModel;

  @override
  void initState() {
    _formModel = MedioFormEntityForm(
        MedioFormEntityForm.formElements(widget.model), null);

    if (_formModel.form.disabled) {
      _formModel.form.markAsDisabled();
    }

    widget.initState?.call(context, _formModel);

    super.initState();
  }

  @override
  void didUpdateWidget(covariant MedioFormEntityFormBuilder oldWidget) {
    if (widget.model != oldWidget.model) {
      _formModel = MedioFormEntityForm(
          MedioFormEntityForm.formElements(widget.model), null);

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
    return ReactiveMedioFormEntityForm(
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

class MedioFormEntityForm implements FormModel<MedioFormEntity> {
  MedioFormEntityForm(
    this.form,
    this.path,
  );

  static const String rotuloControlName = "rotulo";

  static const String subclassificationControlName = "subclassification";

  static const String areaControlName = "area";

  final FormGroup form;

  final String? path;

  String rotuloControlPath() => pathBuilder(rotuloControlName);

  String subclassificationControlPath() =>
      pathBuilder(subclassificationControlName);

  String areaControlPath() => pathBuilder(areaControlName);

  String get _rotuloValue => rotuloControl.value ?? "";

  String get _subclassificationValue => subclassificationControl.value ?? "";

  String get _areaValue => areaControl.value ?? "";

  bool get containsRotulo {
    try {
      form.control(rotuloControlPath());
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

  Object? get rotuloErrors => rotuloControl.errors;

  Object? get subclassificationErrors => subclassificationControl.errors;

  Object? get areaErrors => areaControl.errors;

  void get rotuloFocus => form.focus(rotuloControlPath());

  void get subclassificationFocus => form.focus(subclassificationControlPath());

  void get areaFocus => form.focus(areaControlPath());

  void rotuloValueUpdate(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    rotuloControl.updateValue(value,
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

  void rotuloValuePatch(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    rotuloControl.patchValue(value,
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

  void rotuloValueReset(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      rotuloControl.reset(
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

  FormControl<String> get rotuloControl =>
      form.control(rotuloControlPath()) as FormControl<String>;

  FormControl<String> get subclassificationControl =>
      form.control(subclassificationControlPath()) as FormControl<String>;

  FormControl<String> get areaControl =>
      form.control(areaControlPath()) as FormControl<String>;

  void rotuloSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      rotuloControl.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      rotuloControl.markAsEnabled(
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
  MedioFormEntity get model {
    final currentForm = path == null ? form : form.control(path!);

    if (!currentForm.valid) {
      debugPrint(
          '[${path ?? 'MedioFormEntityForm'}]\n┗━ Avoid calling `model` on invalid form. Possible exceptions for non-nullable fields which should be guarded by `required` validator.');
    }
    return MedioFormEntity(
        rotulo: _rotuloValue,
        subclassification: _subclassificationValue,
        area: _areaValue);
  }

  @override
  void submit({
    required void Function(MedioFormEntity model) onValid,
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
    MedioFormEntity value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) =>
      form.updateValue(MedioFormEntityForm.formElements(value).rawValue,
          updateParent: updateParent, emitEvent: emitEvent);

  @override
  void reset({
    MedioFormEntity? value,
    bool updateParent = true,
    bool emitEvent = true,
  }) =>
      form.reset(
          value: value != null ? formElements(value).rawValue : null,
          updateParent: updateParent,
          emitEvent: emitEvent);

  String pathBuilder(String? pathItem) =>
      [path, pathItem].whereType<String>().join(".");

  static FormGroup formElements(MedioFormEntity? medioFormEntity) => FormGroup({
        rotuloControlName: FormControl<String>(
            value: medioFormEntity?.rotulo,
            validators: [RequiredValidator()],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false),
        subclassificationControlName: FormControl<String>(
            value: medioFormEntity?.subclassification,
            validators: [RequiredValidator()],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false),
        areaControlName: FormControl<String>(
            value: medioFormEntity?.area,
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

class ReactiveMedioFormEntityFormArrayBuilder<T> extends StatelessWidget {
  const ReactiveMedioFormEntityFormArrayBuilder({
    Key? key,
    this.control,
    this.formControl,
    this.builder,
    required this.itemBuilder,
  })  : assert(control != null || formControl != null,
            "You have to specify `control` or `formControl`!"),
        super(key: key);

  final FormArray<T>? formControl;

  final FormArray<T>? Function(MedioFormEntityForm formModel)? control;

  final Widget Function(BuildContext context, List<Widget> itemList,
      MedioFormEntityForm formModel)? builder;

  final Widget Function(
          BuildContext context, int i, T? item, MedioFormEntityForm formModel)
      itemBuilder;

  @override
  Widget build(BuildContext context) {
    final formModel = ReactiveMedioFormEntityForm.of(context);

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

class ReactiveMedioFormEntityFormFormGroupArrayBuilder<T>
    extends StatelessWidget {
  const ReactiveMedioFormEntityFormFormGroupArrayBuilder({
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
      MedioFormEntityForm formModel)? getExtended;

  final Widget Function(BuildContext context, List<Widget> itemList,
      MedioFormEntityForm formModel)? builder;

  final Widget Function(
          BuildContext context, int i, T? item, MedioFormEntityForm formModel)
      itemBuilder;

  @override
  Widget build(BuildContext context) {
    final formModel = ReactiveMedioFormEntityForm.of(context);

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
