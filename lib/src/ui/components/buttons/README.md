# MainButton

Buttons provide a clickable element, which can be used in forms, or anywhere that needs simple,
standard button functionality. They may display text, icons, or both. Buttons can be styled with
several attributes to look a specific way.

## Basic Usage
MainButton(
buttonStyle: MainButtonStyle.primary,
text: AppLocalizationKeys.kSend.translate,
width: double.infinity,
isEnabled: state.isFormValid,
onTap: () {
context.read<ContactUsCubit>().sendContactUs();
},
)

## param