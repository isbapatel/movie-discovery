# Flutter Intern Test: Movie Discovery App

## Overview

Build a **Movie Discovery App** with 4 screens using BLoC architecture and Equatable for state management. This test evaluates your understanding of Flutter architecture patterns, API integration, UI design, and state management.

**Difficulty Level:** Medium to Hard  
**Technology Stack:** Flutter, BLoC, Equatable, HTTP, Shared Preferences

---

## Project Requirements

### ✅ Mandatory Features

1. **Splash Screen**

   - Animated loading indicator
   - 2-3 second delay before navigation
   - Beautiful gradient background with app branding
   - Smooth transition to login

2. **Login Page**

   - Email and password input fields
   - Form validation (email format, password length)
   - Login button with loading state
   - Remember me checkbox (optional bonus)
   - Smooth navigation to landing page after successful login
   - Use Shared Preferences to persist login state

3. **Landing Page**

   - Display list of movies (populated from public API)
   - Search functionality to filter movies
   - Pull-to-refresh capability
   - Smooth scrolling with pagination
   - Tap on movie tile to navigate to details page

4. **Details Page**
   - Full movie information (poster, title, description, rating, release date)
   - Favorite/bookmark functionality
   - Back button with smooth transition
   - Additional information display (cast, reviews, runtime)

### 📋 Architecture Requirements

- **BLoC Pattern**: Separate BLoCs for Authentication, Movie Listing, and Movie Details
- **Equatable**: Use `Equatable` for state objects to enable proper equality checking
- **State Management**: Implement proper state transitions (Loading, Success, Error, Initial)
- **Error Handling**: Graceful error messages and retry mechanisms
- **Code Organization**: Proper folder structure (models, blocs, screens, services, widgets)

---

## Evaluation Rubric

| Criteria              | Points | Notes                                                |
| --------------------- | ------ | ---------------------------------------------------- |
| **Splash Screen**     | 10     | Animation quality, branding                          |
| **Login Screen**      | 15     | Validation, UI/UX, password visibility toggle        |
| **Movie Listing**     | 25     | API integration, pagination, search, pull-to-refresh |
| **Movie Details**     | 20     | Full information display, favorites, animations      |
| **BLoC Architecture** | 20     | Proper event/state pattern, Equatable usage          |
| **Code Quality**      | 10     | Clean code, comments, folder structure               |
| **Total**             | 100    |                                                      |

---

## Challenge Variations for Different Difficulty Levels

### Easy (for beginners adapting)

- Use mock data instead of real API
- Single BLoC for all operations
- Remove pagination
- Simplified UI

### Medium (default)

- Real API with error handling
- Multiple BLoCs
- Basic pagination
- Standard UI patterns

### Hard (advanced bonus)

- Add offline support with local caching
- Implement infinite scroll with load more
- Add movie reviews/comments section
- Add filtering by genre, release year
- Implement wishlist persistence
- Add movie recommendations based on rating
- Implement analytics tracking
- Add dark mode support
- Implement unit and widget tests

---

## Resources

- **TMDB API**: https://www.themoviedb.org/settings/api (You should login/create an account first)
- **Flutter BLoC**: https://bloclibrary.dev/
- **Equatable**: https://pub.dev/packages/equatable
- **HTTP Package**: https://pub.dev/packages/http
- **Shared Preferences**: https://pub.dev/packages/shared_preferences

---

## Expected Deliverables

1. ✅ Complete Flutter project with all 4 screens
2. ✅ Proper folder structure and organization
3. ✅ BLoC architecture implementation
4. ✅ Working API integration
5. ✅ GitHub repository with commits
6. ✅ README with setup and run instructions
7. ✅ Code documentation and comments

---

## Tips for Success

1. **Start with structure first** - Set up folders and architecture before coding
2. **Test frequently** - Run your app after every significant change
3. **Handle errors gracefully** - Show meaningful messages to users
4. **Keep BLoCs focused** - One BLoC per feature
5. **Use meaningful variable names** - Code readability matters
6. **Comment complex logic** - Help reviewers understand your decisions
7. **Version control** - Make frequent commits with clear messages
