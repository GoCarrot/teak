Unity
=====

Add Teak.unitypackage
---------------------

Download the latest *Teak.unitypackage* from https://s3.amazonaws.com/teak-build-artifacts/unity/Teak.unitypackage

Import it into your project in Unity by going to the menu

    **Assets > Import Package > Custom Package**

Then select *Teak.unitypackage*

What This Does
^^^^^^^^^^^^^^

Importing the *Teak.unitypackage* will add the Unity scripts needed to interact with Teak, the native libraries required for Teak functionality, and the other files that Teak needs to function.

Configure Teak
--------------

Go to the Edit menu in Unity and select Teak

    **Edit > Teak**

This will open the Teak configuration in the Unity Inspector, put in your Teak App Id and Teak API Key.

.. note:: Make sure the Inspector tab is visible in your Unity window.

Your Teak App Id and API Key can be found in the Settings for your app on the Teak dashboard.

.. warning:: TODO: Screenshot

What This Does
^^^^^^^^^^^^^^

This stores the Teak App Id and API Key for use by Teak's runtime, and helpers.

Testing It
^^^^^^^^^^^^^^
Just click the **Validate Settings** button, and it will confirm that the settings are correct for your game, or tell you what is wrong.

Tell Teak how to Identify The Current User
------------------------------------------
.. highlight:: csharp

Call the **IdentifyUser** function and pass it a string which uniquely identifies the current user::

    Teak.Instance.IdentifyUser("a unique user identifier");

.. note:: This value should be the same as you send to your back-end for a user id.

This should be called as soon you know the id for the current user.

What This Does
^^^^^^^^^^^^^^
Identifying the user will allow Teak to start sending information to the remote Teak service and allow Teak to function.

Testing It
^^^^^^^^^^
You can now run your game in the Unity Editor, and look in the Unity Log window.

You Should See
^^^^^^^^^^^^^^

::

    [Teak] IdentifyUser(): a unique user identifier

