## Tests Explanation

In this project, I created unit, widget, and integration tests to ensure the app works correctly:

Home Repository Tests

Test HomeRepoImpl to fetch pet data.

Check if it returns a list of pets on success and ServerFailure on errors.

Favourites Repository Tests

Test FavouriteRepoImpl to manage favorite pets.

Covers getting, adding, and deleting favorites.

Ensures proper error handling with server failures.

Widget Tests

Test PetItem widget to display pet name, origin, and life span correctly.

Integration Tests

Test full app flow: Splash → OnBoarding → Main Home → Favorites.
Check navigation and major UI elements like CustomNavBar and GNav

<div style= "display : flex ; justify-content: space-between ; margin : 20px 0px">
<img src = "assets/app_screens/Screenshot_1760530914.png" width = "100px">
<img src = "assets/app_screens/Screenshot_1760532685.png" width = "100px">
<img src = "assets/app_screens/Screenshot_1760535914.png" width = "100px">
<img src = "assets/app_screens/Screenshot_1760536282.png" width = "100px">
<img src = "assets/app_screens/Screenshot_1760538431.png" width = "100px">
<img src = "assets/app_screens/Screenshot_1760559143.png" width = "100px">
<img src = "assets/app_screens/Screenshot_1760559237.png" width = "100px">
<img src = "assets/app_screens/Screenshot_1760703141.png" width = "100px">
<img src = "assets/app_screens/Screenshot_1760704682.png" width = "100px">
</div>
