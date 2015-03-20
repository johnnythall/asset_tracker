#About

###Asset Tracker
The Asset Tracker system is a new way for the film department at Pacific Union College to track their assets (equipment). Users can rent equipment and the software tracks who has it currently. It is also a great way for the film department to always know exactly what we currently own.

###Status
This version of the application has several features beyond the core functionality. It has access control features such as restricting low level users to only see items in their access level. It also has cart functionality that was designed to be used with a barcode scanner. This appliation still needs a reservation system.

#Running the App

###Requirements

-Xcode Developer Tools (Mac) `sudo xcode-select --install`

-Ruby Version > 2.0

-Bundler Gem `gem install bundler`                        


###Installation

Navigate in terminal to the **ftvinventory** directory

Run the code below:

`bundle install` ** - this will install all of the required Ruby Gems.**

`rails s` ** - this will start the rails server.**

In your browser navigate to `localhost:3000`

Every time you would like to run the app just start the server then open the page in your browser.

###Logging in
####Users

The Asset Tracker System is designed with 4 levels of users in mind.

**Administrator** - The Administrator can view, create, and modify everything in the application. They also get access to a special Admin Dashboard.

**TA** - The TA has access to most of the app. They can create and edit assets, use the cart and barcode features, and view users in the system. 

**Orson's Select** - These users can view all of the assets in the system.

**Orson's Followers** - These users can only view the assets at the Orson's follower access level.


####Logins

There are one of each user in the system already.

**Administrator**


```
username: admin@orson.com
password: password
```

**TA**

```
username: ta@orson.com
password: password
```

**Orson's Select**

```
username: select@orson.com
password: password
```


**Orson's Follower**

```
username: follower@orson.com
password: password
```

###Using the Asset Tracker System


####Using the cart to rent assets
From the admin or TA dashboard click `Barcode Entry` on the Nav Bar.

Once the page loads you may begin scanning your barcodes.

The assets will populate the area below the scan field.

When you are finished scanning assets just click the `Checkout Cart` button.

####Adding Assets
Once logged in as a TA or Admin click assets in the Nav Bar.

Click `New Asset` button.

