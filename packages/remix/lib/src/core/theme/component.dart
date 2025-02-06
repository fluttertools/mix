import '../../components/accordion/accordion.dart';
import '../../components/avatar/avatar.dart';
import '../../components/badge/badge.dart';
import '../../components/button/button.dart';
import '../../components/callout/callout.dart';
import '../../components/card/card.dart';
import '../../components/checkbox/checkbox.dart';
import '../../components/chip/chip.dart';
import '../../components/dialog/dialog.dart';
import '../../components/divider/divider.dart';
import '../../components/dropdown_menu/dropdown_menu.dart';
import '../../components/header/header.dart';
import '../../components/icon_button/icon_button.dart';
import '../../components/menu_item/menu_item.dart';
import '../../components/progress/progress.dart';
import '../../components/radio/radio.dart';
import '../../components/scaffold/scaffold.dart';
import '../../components/segmented_control/segmented_control.dart';
import '../../components/select/select.dart';
import '../../components/slider/slider.dart';
import '../../components/spinner/spinner.dart';
import '../../components/switch/switch.dart';
import '../../components/textfield/textfield.dart';
import '../../components/toast/toast.dart';

class RemixComponentTheme {
  final AccordionStyle accordion;
  final AvatarStyle avatar;
  final BadgeStyle badge;
  final ButtonStyle button;
  final CalloutStyle callout;
  final CardStyle card;
  final CheckboxStyle checkbox;
  final DialogStyle dialog;
  final ChipStyle chip;
  final DividerStyle divider;
  final HeaderStyle header;
  final IconButtonStyle iconButton;
  final MenuItemStyle menuItem;
  final ProgressStyle progress;
  final RadioStyle radio;
  final ScaffoldStyle scaffold;
  final SegmentedControlStyle segmentedControl;
  final SelectStyle select;
  final SpinnerStyle spinner;
  final SwitchStyle switchComponent;
  final TextFieldStyle textField;
  final ToastStyle toast;
  final SliderStyle slider;
  final DropdownMenuStyle dropdownMenu;

  const RemixComponentTheme({
    required this.accordion,
    required this.avatar,
    required this.badge,
    required this.button,
    required this.callout,
    required this.card,
    required this.checkbox,
    required this.dialog,
    required this.chip,
    required this.divider,
    required this.header,
    required this.iconButton,
    required this.menuItem,
    required this.progress,
    required this.radio,
    required this.scaffold,
    required this.segmentedControl,
    required this.select,
    required this.spinner,
    required this.switchComponent,
    required this.textField,
    required this.toast,
    required this.slider,
    required this.dropdownMenu,
  });

  factory RemixComponentTheme.light() {
    return const RemixComponentTheme(
      accordion: AccordionStyle(),
      avatar: AvatarStyle(),
      badge: BadgeStyle(),
      button: ButtonStyle(),
      callout: CalloutStyle(),
      card: CardStyle(),
      checkbox: CheckboxStyle(),
      dialog: DialogStyle(),
      chip: ChipStyle(),
      divider: DividerStyle(),
      header: HeaderStyle(),
      iconButton: IconButtonStyle(),
      menuItem: MenuItemStyle(),
      progress: ProgressStyle(),
      radio: RadioStyle(),
      scaffold: ScaffoldStyle(),
      segmentedControl: SegmentedControlStyle(),
      select: SelectStyle(),
      spinner: SpinnerStyle(),
      switchComponent: SwitchStyle(),
      textField: TextFieldStyle(),
      toast: ToastStyle(),
      slider: SliderStyle(),
      dropdownMenu: DropdownMenuStyle(),
    );
  }

  factory RemixComponentTheme.dark() {
    return RemixComponentTheme.light().copyWith(
      accordion: const AccordionDarkStyle(),
      avatar: const AvatarDarkStyle(),
      badge: const BadgeDarkStyle(),
      button: const ButtonDarkStyle(),
      callout: const CalloutDarkStyle(),
      card: const CardDarkStyle(),
      checkbox: const CheckboxDarkStyle(),
      dialog: const DialogDarkStyle(),
      chip: const ChipDarkStyle(),
      divider: const DividerDarkStyle(),
      header: const HeaderDarkStyle(),
      iconButton: const IconButtonDarkStyle(),
      menuItem: const MenuItemDarkStyle(),
      progress: const ProgressDarkStyle(),
      radio: const RadioDarkStyle(),
      scaffold: const ScaffoldDarkStyle(),
      segmentedControl: const SegmentedControlDarkStyle(),
      select: const SelectDarkStyle(),
      spinner: const SpinnerDarkStyle(),
      switchComponent: const SwitchDarkStyle(),
      textField: const TextFieldDarkStyle(),
      toast: const ToastDarkStyle(),
      slider: const SliderDarkStyle(),
      dropdownMenu: const DropdownMenuDarkStyle(),
    );
  }

  RemixComponentTheme copyWith({
    AccordionStyle? accordion,
    AvatarStyle? avatar,
    BadgeStyle? badge,
    ButtonStyle? button,
    CalloutStyle? callout,
    CardStyle? card,
    CheckboxStyle? checkbox,
    DialogStyle? dialog,
    ChipStyle? chip,
    DividerStyle? divider,
    HeaderStyle? header,
    IconButtonStyle? iconButton,
    MenuItemStyle? menuItem,
    ProgressStyle? progress,
    RadioStyle? radio,
    ScaffoldStyle? scaffold,
    SegmentedControlStyle? segmentedControl,
    SelectStyle? select,
    SpinnerStyle? spinner,
    SwitchStyle? switchComponent,
    TextFieldStyle? textField,
    ToastStyle? toast,
    SliderStyle? slider,
    DropdownMenuStyle? dropdownMenu,
  }) {
    return RemixComponentTheme(
      accordion: accordion ?? this.accordion,
      avatar: avatar ?? this.avatar,
      badge: badge ?? this.badge,
      button: button ?? this.button,
      callout: callout ?? this.callout,
      card: card ?? this.card,
      checkbox: checkbox ?? this.checkbox,
      dialog: dialog ?? this.dialog,
      chip: chip ?? this.chip,
      divider: divider ?? this.divider,
      header: header ?? this.header,
      iconButton: iconButton ?? this.iconButton,
      menuItem: menuItem ?? this.menuItem,
      progress: progress ?? this.progress,
      radio: radio ?? this.radio,
      scaffold: scaffold ?? this.scaffold,
      segmentedControl: segmentedControl ?? this.segmentedControl,
      select: select ?? this.select,
      spinner: spinner ?? this.spinner,
      switchComponent: switchComponent ?? this.switchComponent,
      textField: textField ?? this.textField,
      toast: toast ?? this.toast,
      slider: slider ?? this.slider,
      dropdownMenu: dropdownMenu ?? this.dropdownMenu,
    );
  }
}
