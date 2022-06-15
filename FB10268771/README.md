# The time in the CarPlay simulator doesn't follow the time in the iOS simulator

The time shown in the clock in the CarPlay simulator should follow the time shown in the iOS simulator. Currently it follows the time of the Mac the simulator is running on.

Because the CarPlay simulator simulates a display that’s connected to the iPhone, the two clocks should be in sync. Having the time in the CarPlay simulator being in sync with the iOS simulator would also allow developers to control the time in the CarPlay simulator using the `xcrun simctl` tool which can come in handy when doing demos or taking screenshots.