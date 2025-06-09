🛒 Flutter Shopping Cart App — Product & Cart Management 🛍️

Flutter Shopping Cart App is a mini project showcasing product listing, cart functionality, and state management using Provider. Users can browse products, add/remove items to the cart, and view a real-time cart summary.

🌟 Project Highlights

🏠 Home Screen (Product Listing)

Displays a grid/list of products with images, titles, and prices.

Uses ProductProvider to fetch and expose product data.

"Add to Cart" buttons to quickly add items.

🛒 Cart Screen

Shows items added to the cart with quantity controls.

Update quantities or remove items directly from the cart.

Displays subtotal, tax, and total price calculation.

🔄 State Management with Provider

ProductProvider: Manages product catalog fetching and state.

CartProvider: Tracks cart items, quantities, and total cost.

Providers are wired using ChangeNotifierProvider at the app root.

🎨 Theming & UI

Responsive GridView on the Home Screen and ListView on the Cart Screen.

AppBar with dynamic cart icon badge showing item count.

Clean Material design with consistent padding and typography.

🧰 Tech Stack

    Category                          Tools & Libraries

    Framework                         Flutter, Dart

    State Management                  Provider

    Dependency Injection              provider package

    UI Components                     Material Widgets
