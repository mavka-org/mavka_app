## mavka

### Altered `android`
- https://pub.dev/packages/firebase_auth
- https://stackoverflow.com/a/38097692
- https://pub.dev/packages/flutter_facebook_login
- https://pub.dev/packages/flutter_tex

### Project structure
```
lib
├── blocs                # BLOC components
├── components           # Reusable ui components
├── layouts              # Reusable layouts
│   ├── auth
│   └── authorized
├── models               # Models (no ui)
├── model_views          # Reusable ui components for models
├── screens              # Screens
│   ├── auth
│   ├── authorized
│   ├── getting_started  # Getting started screens (after registration)
│   └── navigation       # Bottom navbar screens
├── services             # All work with the backend
└── utilities            # Reusable tools
```
