
<!-- GitHub Project Banner -->

<p align="center">

<img src="https://github.com/user-attachments/assets/501c98ee-809c-4376-b32d-6d38ae07c489" alt="Project Banner" width="100%">
</p>

<p align="center">

<img src="https://img.shields.io/badge/SwiftUI-black?logo=swift&logoColor=white&labelColor=black&color=black">
<img src="https://img.shields.io/badge/CustomTextField-black?labelColor=black&color=black">
</p>

# CustomTextField

A reusable SwiftUI view that displays an editable text interface with a
customizable placeholder, background, and styling.

------------------------------------------------------------------------

## » Declaration

``` swift
struct CustomTextField: View
```

``` swift
init(placeholder: String, text: Binding<String>)
```

------------------------------------------------------------------------

## » Overview

`CustomTextField` is a reusable SwiftUI component that wraps around the
native `TextField`, providing additional styling, placeholder
customization, and shadow effects.

It improves readability and reusability by encapsulating common UI
styles (padding, corner radius, stroke border) into a single view.

Unlike the default `TextField` initializer, `CustomTextField` allows
customization of the placeholder color using the `prompt` parameter,
enabling consistency across light and dark themes.

------------------------------------------------------------------------

## » Example Usage

``` swift
struct ContentView: View {
    @State private var email: String = ""

    var body: some View {
        VStack(spacing: 20) {
            CustomTextField(
                placeholder: "Enter your email",
                text: $email
            )

            Text("You typed: \(email)")
                .foregroundColor(.gray)
        }
        .padding()
    }
}
```

------------------------------------------------------------------------

## » Implementation

``` swift
struct CustomTextField: View {
    var placeholder: String
    @Binding var text: String
    
    var body: some View {
        TextField(
            "", // Empty label, using prompt instead
            text: $text,
            prompt: Text(placeholder)
                .foregroundColor(.gray) // Custom placeholder color
        )
        .padding()
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
        .autocorrectionDisabled(true)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.gray, lineWidth: 1)
        )
    }
}
```

------------------------------------------------------------------------

## » Concept Highlights

-   **Placeholder Customization** → Uses `.prompt` to style placeholder
    text (`foregroundColor`, `font`, etc.).\
-   **Reusability** → Can be dropped into any SwiftUI project as a
    styled text field.\
-   **Encapsulation** → Keeps UI code clean by centralizing text field
    styling.\
-   **Light/Dark Mode Ready** → Placeholder and shadow styles can adapt
    to themes.

------------------------------------------------------------------------

## » Quick Reference Table

  Feature                  Supported
  ------------------------ -----------------
  Placeholder Color        ✅ via `prompt`
  Corner Radius            ✅
  Shadow                   ✅
  Border Stroke            ✅
  Auto-correction Toggle   ✅

------------------------------------------------------------------------

## » Author Footer

**Created By:** Vemparala Sri Satya RaghuRam\
**License:** MIT\
**Platform:** SwiftUI

<p align="left">

<img src="https://img.shields.io/badge/%23BeyondCertifications-black?logo=tag&logoColor=white&labelColor=black&color=black">
<img src="https://img.shields.io/badge/%23IndustryOriented-black?logo=tag&logoColor=white&labelColor=black&color=black">
<img src="https://img.shields.io/badge/%23CodeWithRaghuRam-black?logo=tag&logoColor=white&labelColor=black&color=black">

</p>

