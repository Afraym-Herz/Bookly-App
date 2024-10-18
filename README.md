# Core Folders

this the first part of application , it is contain the errors , utils and widgets which used in whole the application 


## Widgets Files

this folder contain the widgets which we used in all the application

### 1 - Custom Button

 it is custom button we use with special attributes 

- the attributes are backgroundColor, textColor, borderRadius, text, fontSize and onPressed (void Function?)

we set border radius to button by borderRadius
we set the function of Button by onPressed 


### 2 - Custom Circular Indicator 

- it is just center Circular Indicator 


### 3 - Error Text

- it is just error message with special style and center location



## Utils Files

it is the services and utils Functions and classes we will use in whole application 

### 1 - Api Services

 it is class used to dealing with Dio package ( using to http requests )

- it may contain the requested Functions ( such get , post , delete and put ) but in our case we only use get
- it contains const BaseUrl which we used to all requests  
- it accept instance of Dio 
- it contains get Function , it return Future<Map<String , dynamic>> if request have done and return ServicesFaliure if any error happen 
- it accept endPoint parameter (required String)
- create response (var) to contain the response of dio get request and return data which locate in response


### 2 - App Routers

 it is abstract class using in it go_router package

- first we create static Strings to point to the names or paths of screens we can go to it (if path of one of screens is '/' means this is the first screen will shown) 
- second we create static final GoRouter variable and use attribute routes list to storage GoRoute list
- GoRoute , it is the item accept two parameter 
    1 - path : we put on it the path which we create in start of App Routers class with static behivor to all screens
    2 - builder : accept (context , state) 
        a - state : it is the state of Router we using it to many operator such sent object ot the screens we have go to it 
- if we want to create BlocProvider to only one screen we put it up to screen in App Routers for bidden any screen to share the same Bloc and to destroy the Bloc when go out from screen


### 3 - Services Locator 

 it is file using to shortcut the constructor in ApiServices and HomeRepoImpl 

- first by import GetIt package we create GetIt instance (getIt)
- second we use getIt and using registerSingelton and in <class> determine the class we shortcut its constructor
- third we shortcut ApiServices constructor then by ApiServices shortcut we shortcut HomeRepoImpl constructor


### 4 - Styles 

 it is class contains all styles we will use in whole application



# Features Folders

it is Folder which contain all Screens , UIs and , Models and Repos which will shown to User


## A - Home 

it is folder which conatins all Folders and Files we will use it in Home Screen 

### 1 - data 

it is folder which contains all models and Repos which we use to get data to Home Screen

#### 1 - models 

it is folder which contains all models which we use to convert data to models 

- it is only folder is named book_model contains all book models such (book_model , access_info , image_links and volume_info) and all this models use in the main model and it is the book_model

#### 2 - repos

it is folder which contains all abstract class repos and their implemetation classes

##### home repo

 it is an abstract class  which contains abstract Functions which we must set implementations to them

- it has three Functions fetchBestSellerBooks , fetchFeaturedBooks and fetchSimilarBooks
- it is named Repo design Pattern

##### home repo impl

- it accept ApiServices in its constructor (see ServicesLocator section)
- we use get method from ApiServies and set the required parameter endPoint and storage the return from get method in variable named data (map<String , dynamic>)
- we convert all items exist in data to book model by factory constructor and add their book models to books (list)
- all Functions is the same just different in q (parameter) except fetchSimilarBooks we put category (required parameter) in q 


### 2 - presentation 

it is folder which contains all managers (state management) and all views , widgets will shown in home screen


#### 1 - manager

it is folder which contains all State Managements in Home Screen 

##### Books_cubit (Folders)

 it is a cubit we using to management best seller books list 

###### Books_states

 it is the states of Books_cubit

- success state contains books (list<BookModel>) and accept it in constructor
- faliure state contains errMessage and accept it in constructor

###### Books_cubit (Files)

- it accept homeRepoImpl to use fetchBestSellerBooks method 
- first we emit LoadingState then if the request get done will emit SuccessState with books list
- if any error happens will emit FaliureState with errMessage

and it all Cubits which they exist in Manager Folder


#### 2 - Views 

it is folder which contains all widgets and Screens will shown in home view

##### Widgets 

###### 1 - Custom Book Image

it is Custom Image we use to put book's image

- it accept the image url in consturctor 
- first we use ClipRRect to set border to the image 
- second we use AspectRatio to make the Custom Book Image responsive to any screen and give to it 2.6/4 in aspectRatio and it means this image will take 2.6 width from 4 height of the available space 
- third we use CachedNetworkImage to storage the image in cache memory , show the image by special way , use errorWidget attribute and fit the image in all avaliable space 

###### 2 - Custom Row Rating

it is a custom Row we use it to show book's Ratings and counts

- it accept the Ratings , Counts and the main aligment for the Row
- we use opacity widget in Count to add opacity 


###### 3 - Custom App Bar 

it is a custom app bar using in home Screen 

- we use spacer to set the all availabel space between logo and search Icon

###### 4 - Custom App Bar Book Details 

it is a custom app bar using in book details Screen 

- it is like Custom app bar just different with Function of Icon close is pop the current screen


###### 5 - Best Seller List Item

it is the item is used in Best Seller list to show the book with image , descreption and rating of book

- we put all item in GesturDetector 
- the onTap of GesturDetector will use to goRoute to BookDetailsView and use extra attripute to send the current BookModel to use in BookDetailsView 
- we use CustomBookImage (see above)
- we put the description of book in expanded widget to use all available space
- we use MediaQuere in sized box which contains the Text title to get width of device and multiplaction the width with num to determine correct width and make responsive Text
- we use attribute maxLine to determine the number of lines will show and use attribute overflow to determine the view will shown when overflow and in our case we use TextOverflow.ellipsis to set three point when the text has more than 2 lines
- use spacer to set the Custom Row rating in end of screen 

###### 6 - 