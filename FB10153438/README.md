# After introducing the customizable toolbar in iPadOS 16, Apple needs to come up with a best practice for where actions used less often are placed

iPadOS 16 introduces customizable toolbars that let users put often-used actions in the navigation bar. This is great but it raises the question:

Where do we, as designers and developers, place actions that are used less often?

The customizable toolbar should make actions that are used often easily accessible while also ensuring that actions that are used less frequently are accessible. That’s not the case in the current implementation, and as developers and designers, we have no best practice describing where to place the actions that are used less often.

Customizable toolbars are common in Mac apps and on the Mac the actions that are used less often can be placed in the menu bar. That requires the user to drill down a menu hierarchy in the menu bar to find an action but at least the action remains accessible. There’s no such thing on iPadOS.

So what can we do?

One option is to use the new additionalOverflowItems property on UINavigationBar. 

When adopting the customizable toolbar, an overflow item is shown in the navigation bar. That item serves as the place where users initiate customization of the toolbar. This is also where items in the menu bar are shown when they don’t find in the menu because it’s too narrow. We can add actions that are used less often to this menu using the new additionalOverflowItems property on UINavigationItem. This feels like a natural place to find these items as a user. In many ways, it’s the perfect place for our less-used actions. To name a few:

- This is where often used actions in the toolbar are placed when there’s not enough room to show the actions in the toolbar, so users should already expect to find various actions here.
- The icon of the overflow item is the ellipsis, indicating that there can be ‘more’ in this menu. So I’d a place where we can put a variety of actions.
- The overflow item is shown in the toolbar, so actions used less often are still close to the actions that are used often. They’re just buried in a menu.

However, there’s a problem with putting actions that are used infrequently into this menu using the current adoption of the overflow item. What if the user decides that they frequently use an action and therefore place it in the toolbar? Then we have a problem. If the toolbar becomes narrow the toolbar item will ‘overflow’ into the overflow item and we’ll show the action twice: once because it overflowed into the item and once because we explicitly added it to the overflow item.

I can think of three ways to solve this. There could very well be many more though.

1. Let developers associate some identifier (or maybe reuse the existing customizationIdentifier) to let developers create a relationship between items in the toolbar and added to the overflow item. UIKit should only add items in the toolbar to the overflow item if the developer hasn’t already added an item with the same identifier to the menu.
2. Provide an API that let developers know which items users have added to the toolbar. That way we can adjust our overflow menu accordingly.
3. Stop adding items that don’t fit into the toolbar to the overflow menu. Require developers to add all items themselves.

I hope this is improved during the beta cycle. The current implementation leaves too big of a design concern unsolved and I fear that we’ll see this scenario poorly handled and differently handled in the apps launching with customizable toolbars, my apps included.