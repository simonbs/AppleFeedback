# UIButton's toolTip property and UIToolTipInteraction does not work on visionOS

visionOS can show tooltips on views using the .help(…) modifier in SwiftUI. However, I’d expect that UIButton’s toolTip property and the UIToolTipInteraction in UIKit could also be used to present tooltips on views in visionOS.

The attached sample project that tooltips can be shown using the .help(…) modifier in SwiftUI but that UIButton’s toolTip property and UIToolTipInteraction does not cause any tooltips to be shown invisionOS.